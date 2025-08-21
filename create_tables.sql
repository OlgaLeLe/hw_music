-- Таблица жанров
CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица исполнителей
CREATE TABLE Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Связка "исполнитель - жанр"
CREATE TABLE Artist_Genre (
    artist_id INT REFERENCES Artist(id) ON DELETE CASCADE,
    genre_id INT REFERENCES Genre(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

-- Таблица альбомов
CREATE TABLE Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT CHECK (release_year >= 1900)
);

-- Связка "исполнитель - альбом"
CREATE TABLE Artist_Album (
    artist_id INT REFERENCES Artist(id) ON DELETE CASCADE,
    album_id INT REFERENCES Album(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, album_id)
);

-- Таблица треков
CREATE TABLE Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    duration INT NOT NULL CHECK (duration > 0), -- длительность в секундах
    album_id INT REFERENCES Album(id) ON DELETE CASCADE
);

-- Таблица сборников
CREATE TABLE Collection (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT CHECK (release_year >= 1900)
);

-- Связка "сборник - трек"
CREATE TABLE Collection_Track (
    collection_id INT REFERENCES Collection(id) ON DELETE CASCADE,
    track_id INT REFERENCES Track(id) ON DELETE CASCADE,
    PRIMARY KEY (collection_id, track_id)

);
