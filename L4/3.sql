
-- Написать SELECT-запросы, которые выведут информацию согласно инструкциям ниже.
-- Внимание! Результаты запросов не должны быть пустыми (учтите при заполнении таблиц).


set search_path to public;

-- 1 название и год выхода альбомов, вышедших в 2018 году;
select 
	title, 
	"year"
from 
	albums 
where 
	"year" = 2018;

-- 2 название и продолжительность самого длительного трека;
select 
	title,
	duration 
from 
	tracks
order by duration desc 
limit 1;

-- 3  название треков, продолжительность которых не менее 3,5 минуты;
select 
	title 
from tracks
where 
	duration >= 3.5 *60;
	
-- 4 названия сборников, вышедших в период с 2018 по 2020 год включительно;
select 
	title
from collections
where 
	"year" between 2018 and 2020;
	
-- 5 исполнители, чье имя состоит из 1 слова;
select 
	"name" 
from performers
where 
	position(' ' in "name") = 0;
-- ну или "name" not like '% %';

-- 6 название треков, которые содержат слово "мой"/"my".
select 
	title
from tracks 
where 
	lower(title) like '%my %' or
	lower(title) like '% my%' or
	lower(title) like '%мой %' or
	lower(title) like '% мой%';
