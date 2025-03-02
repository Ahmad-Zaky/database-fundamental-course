drop table if exists temp;
create table temp(t int);
insert into temp(t) select random()*100 from generate_series(0, 1000000);
select t from temp limit 10;
select count(*) from temp;