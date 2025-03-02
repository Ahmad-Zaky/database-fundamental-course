drop table if exists employees;

create table employees(id serial primary key, name text);

-- random_string function
create or replace function random_string(length integer) returns text as 
$$
declare
  chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
  result text := '';
  i integer := 0;
  length2 integer := (select trunc(random() * length + 1));
begin
  if length2 < 0 then
    raise exception 'Given length cannot be less than 0';
  end if;
  for i in 1..length2 loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
  end loop;
  return result;
end;
$$ language plpgsql;


insert into employees(name)(select random_string(10) from generate_series(0, 1000000));

\d employees

select * from employees where id = 1000;

-- index only - select (id)
explain analyze select id from employees where id = 1000;

-- index scan - select (name)
explain analyze select name from employees where id = 1000;

-- Sequential Scan (Parallel)
explain analyze select id from employees where name = 'Cj';

create index employees_name_idx on employees(name);

-- Bitmap Heap Scan
explain analyze select id, name from employees where name = 'Cj';

-- Sequential Scan (Parallel) because of expression where clause
explain analyze select id, name from employees where name like '%Cj%';