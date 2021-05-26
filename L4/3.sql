set search_path to public;

-- 1
select 
	title, 
	"year"
from 
	albums 
where 
	"year" = 2018;

-- 2
select 
	title,
	duration 
from 
	tracks
order by duration desc 
limit 1;

-- 3
select 
	title 
from tracks
where 
	duration >= 3.5 *60;
	
-- 4
select 
	title
from collections
where 
	"year" between 2018 and 2020;
	
-- 5
select 
	"name" 
from performers
where 
	position(' ' in "name") = 0;

-- 6
select 
	title
from tracks 
where 
	lower(title) like '%my %' or
	lower(title) like '% my%' or
	lower(title) like '%мой %' or
	lower(title) like '% мой%';
