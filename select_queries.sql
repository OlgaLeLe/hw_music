-- Задание 2

-- Самый длительный трек
SELECT title, duration
FROM Track
ORDER BY duration DESC
LIMIT 1;

-- Треки не короче 3,5 минут (210 секунд)
SELECT title
FROM Track
WHERE duration >= 210;

-- Сборники 2018–2020
SELECT title
FROM Collection
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители с одним словом в имени
SELECT name
FROM Artist
WHERE name NOT LIKE '% %';

-- Треки со словом "мой" или "my"
SELECT title
FROM Track
WHERE LOWER(title) LIKE '%my%'
   OR LOWER(title) LIKE '%мой%';

-- Задание 3

-- Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genre g
JOIN Artist_Genre ag ON g.id = ag.genre_id
GROUP BY g.name;

-- Количество треков в альбомах 2019–2020
SELECT COUNT(t.id) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по альбомам
SELECT a.title AS album, AVG(t.duration) AS avg_duration
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.title;

-- Исполнители без альбомов в 2020
SELECT DISTINCT ar.name
FROM Artist ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM Artist_Album aa
    JOIN Album a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

-- Сборники, где есть треки конкретного исполнителя (Queen)
SELECT DISTINCT c.title
FROM Collection c
JOIN Collection_Track ct ON c.id = ct.collection_id
JOIN Track t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Queen';

-- Задание 4

-- Альбомы с исполнителями более чем одного жанра
SELECT a.title
FROM Album a
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
JOIN Artist_Genre ag ON ar.id = ag.artist_id
GROUP BY a.title
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- Треки, не вошедшие в сборники
SELECT t.title
FROM Track t
LEFT JOIN Collection_Track ct ON t.id = ct.track_id
WHERE ct.collection_id IS NULL;

-- Исполнители самого короткого трека
SELECT DISTINCT ar.name, t.title, t.duration
FROM Track t
JOIN Album a ON t.album_id = a.id
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE t.duration = (SELECT MIN(duration) FROM Track);

-- Альбомы с минимальным количеством треков
SELECT a.title, COUNT(t.id) AS track_count
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.title
HAVING COUNT(t.id) = (
    SELECT MIN(track_cnt)
    FROM (
        SELECT COUNT(t.id) AS track_cnt
        FROM Album a
        JOIN Track t ON a.id = t.album_id
        GROUP BY a.id
    ) sub
);