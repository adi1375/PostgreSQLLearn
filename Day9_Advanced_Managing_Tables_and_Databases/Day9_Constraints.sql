CREATE TABLE songs(
song_id SERIAL PRIMARY KEY,
song_name VARCHAR(30) NOT NULL,
genre VARCHAR(30) DEFAULT 'Not defined',
price NUMERIC(4,2) CHECK (price>=1.99),
release_date DATE CONSTRAINT date_check CHECK (release_date BETWEEN '01-01-1950' AND CURRENT_DATE)
);

SELECT * FROM songs;

INSERT INTO songs
(song_name, price, release_date)
VALUES ('SQL song',0.99,'01-07-2022');

ALTER TABLE songs
DROP CONSTRAINT songs_price_check;

ALTER TABLE songs
ADD CONSTRAINT songs_price_check CHECK (price>=0.99);

SELECT * FROM songs;