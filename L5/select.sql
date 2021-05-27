set search_path to public;

-- 1 количество исполнителей в каждом жанре;
select 
	g.name,
	count(p.performerid)
from 
	performersgengres p
inner join gengres g on p.gengreid = g.id
group by p.gengreid, g.name;


-- 2 количество треков, вошедших в альбомы 2019-2020 годов;
select 
	count(t.id)
from albums a
inner join tracks t on t.albumid = a.id 
where a."year" between 2019 and 2020


-- 3 средняя продолжительность треков по каждому альбому;
select 
	a.title,
	round(avg(t.duration) / 60 ::dec, 2) "Средняя продолжительность, мин"	
from tracks t 
inner join albums a on t.albumid = a.id 
group by a.id, a.title;

-- 4 все исполнители, которые не выпустили альбомы в 2020 году;

-- У меня в базе такие все, так что позволю себе поменять задание на 1968 год -)
select
	perf."name"
from performers perf
left join
	(select 
		distinct p.id id_sq
	from performers p 
	inner join performersalbums pa on p.id = pa.performerid 
	inner join albums a on a.id = pa.albumid 
	where a."year" = 1968) sq on perf.id = sq.id_sq
where sq.id_sq is null;


-- 5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select 
	distinct c.title collection 
from
	performers p 
inner join performersalbums pa on pa.performerid = p.id
inner join albums a on a.id = pa.albumid 
inner join tracks t on t.albumid = a.id 
inner join collectionstracks ct on ct.trackid = t.id 
inner join collections c on c.id = ct.collectionid 
where p."name" ilike '%queen%'
order by c.title;


-- 6 название альбомов, в которых присутствуют исполнители более 1 жанра;
select 
	a.title 
from
	albums a
inner join performersalbums pa on pa.albumid = a.id 
inner join performers p on p.id = pa.performerid 
inner join performersgengres pg1 on pg1.performerid = p.id 
inner join
	(select
		pg.gengreid gengreid,
		count(pg.performerid) gengrecount
	from performersgengres pg 
	group by pg.gengreid 
	) q1 on q1.gengreid = pg1.gengreid 
where
	q1. gengrecount > 1;


-- 7 наименование треков, которые не входят в сборники;
select 
	t.title 
from tracks t 
left join collectionstracks ct on t.id = ct.trackid
where ct.collectionid is null;


-- 8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select
	p."name" 
from performers p 
inner join performersalbums pa on p.id = pa.performerid 
inner join tracks t on t.albumid = pa.albumid  
where
	t.duration in (select min(t2.duration) from tracks t2)


-- 9 название альбомов, содержащих наименьшее количество треков.
select
	a.title	
from albums a 
inner join 
	(
		select 
			t2.albumid albumid2,
			count(t2.id) trcount
		from tracks t2 
		group by t2.albumid 
	) q1 on a.id = q1.albumid2
where 
	q1.trcount in (
		select min(q2.trcount1) from
			(
				select count(t.id) trcount1
				from tracks t 
				group by t.albumid 
			) q2
		);
