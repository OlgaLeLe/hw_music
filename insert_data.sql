-- Жанры
INSERT INTO Genre (name) VALUES
('Rock'),
('Pop'),
('Jazz');

-- Исполнители
INSERT INTO Artist (name) VALUES
('Queen'),
('Adele'),
('Miles Davis'),
('Imagine Dragons');

-- Связь исполнителей с жанрами
INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
(1, 1), -- Queen -> Rock
(2, 2), -- Adele -> Pop
(3, 3), -- Miles Davis -> Jazz
(4, 1), -- Imagine Dragons -> Rock
(4, 2); -- Imagine Dragons -> Pop

-- Альбомы
INSERT INTO Album (title, release_year) VALUES
('A Night at the Opera', 1975),
('25', 2015),
('Kind of Blue', 1959);

-- Связь исполнителей с альбомами
INSERT INTO Artist_Album (artist_id, album_id) VALUES
(1, 1), -- Queen -> A Night at the Opera
(2, 2), -- Adele -> 25
(3, 3); -- Miles Davis -> Kind of Blue

-- Треки (минимум 6)
INSERT INTO Track (title, duration, album_id) VALUES
('Bohemian Rhapsody', 354, 1),
('Love of My Life', 220, 1),
('Hello', 295, 2),
('Send My Love', 223, 2),
('So What', 545, 3),
('Freddie Freeloader', 589, 3);

-- Сборники
INSERT INTO Collection (title, release_year) VALUES
('Greatest Hits Rock', 2000),
('Pop Collection', 2018),
('Jazz Classics', 1995),
('Mixed Collection', 2020);

-- Связь сборников с треками
INSERT INTO Collection_Track (collection_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 3),
(4, 5);

-- Дополнение для альбомов 2019–2020 (Imagine Dragons)
INSERT INTO Album (title, release_year) VALUES
('Origins', 2019),
('New Era', 2020);

-- Связка с исполнителем Imagine Dragons
INSERT INTO Artist_Album (artist_id, album_id) VALUES
(4, 4), -- Origins
(4, 5); -- New Era

-- Треки 2019
INSERT INTO Track (title, duration, album_id) VALUES
('Natural', 189, 4),
('Bad Liar', 240, 4);

-- Треки 2020
INSERT INTO Track (title, duration, album_id) VALUES
('New Start', 200, 5),
('Future Bright', 215, 5);

-- Привязка новых треков к сборникам
INSERT INTO Collection_Track (collection_id, track_id) VALUES
(4, 7),
(4, 8),
(2, 9),
(1, 10);