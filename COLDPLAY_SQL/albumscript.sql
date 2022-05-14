#Creating a database for Coldplay music
#Creating a table for albums

CREATE TABLE albums (
	album_id CHAR(2),
    album_name VARCHAR(100) NOT NULL,
    album_releasedate DATE,
    CONSTRAINT AlbumKey PRIMARY KEY (album_id));

ALTER TABLE albums
RENAME COLUMN album_releasedate to album_rdate;

SELECT *
FROM albums;

INSERT 
INTO albums (album_id, album_name, album_rdate)
VALUES (1, 'Parachutes', '2000-07-10'),
(2, 'A Rush Of Blood To The Head', '2002-08-26');	  


ALTER TABLE albums
ADD COLUMN album_length TIME;

#Activating and deactivating safe update mode
SET SQL_SAFE_UPDATES = 0;

UPDATE coldplay.albums
SET album_length = '00:54:08'
WHERE album_id = 2  AND album_id <> 0;

UPDATE coldplay.albums
SET album_length = '00:41:29'
WHERE album_id = 1 AND album_id <> 0;

SELECT album_name, (second(album_length)+minute(album_length)*60) AS totalseconds
FROM albums;

INSERT INTO albums (album_id, album_name, album_rdate, album_length)
VALUES (3, 'X&Y', '2005-06-06', '01:02:30'),
	(4, 'Viva La Vida Or Death And All His Friends', '2008-06-12', '00:45:49'),
    (5, 'Mylo Xyloto', '2011-10-24', '00:44:09'),
    (6, 'Ghost Stories', '2014-05-16', '00:42:37'),
    (7, 'A Head Full Of Dreams', '2015-12-04', '00:45:45'),
    (8, 'Everyday Life', '2019-11-22', '00:52:55');
    
INSERT INTO albums (album_id, album_name, album_rdate, album_length)
VALUES (9, 'Music Of The Spheres Vol. 1', '2021-10-15', '00:41:50'); 