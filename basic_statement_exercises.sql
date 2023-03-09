USE albums_db; -- 1
SELECT database();
SHOW TABLES;
SELECT * FROM albums;
-- 2 The primary key for Albums is id
-- 3 The column "named" represents the album's name
-- 4 The sales column represents $ of albums sold in the millions
SELECT * FROM albums
WHERE artist = 'Pink Floyd'; -- 5
SELECT release_date FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band"; -- 6 1967
-- 7 Grunge, Alternative rock
SELECT name, release_date FROM albums
WHERE release_date BETWEEN '1990 ' AND '1999'; -- 8
SELECT name, sales FROM albums
WHERE sales < "20"; -- 9
