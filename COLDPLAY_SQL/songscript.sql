#Creating a table for songs

CREATE TABLE songs (
	song_id INT NOT NULL AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    song_length TIME,
    album_id CHAR(2),
    song_trackno INT,
    CONSTRAINT SongID PRIMARY KEY (song_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
    );
    
SELECT *
FROM songs;

INSERT 
INTO songs (song_name, song_length, album_id, song_trackno)
VALUES ('Don''t Panic', '00:02:17', 1, 1),
('Shiver', '00:05:00', 1, 2);

INSERT 
INTO songs (song_name, song_length, song_trackno)
VALUES 
('Fix You', '00:04:54', 4);

SELECT s.song_name, a.album_name, s.song_trackno
FROM songs AS s
INNER JOIN albums AS a
ON s.album_id = a.album_id; 

SELECT *
FROM songs
WHERE album_id = (
	SELECT album_id 
    FROM albums
    WHERE album_name = 'Parachutes')
ORDER BY song_name DESC;


SELECT s.song_name, a.album_name, s.song_trackno
FROM songs AS s
LEFT JOIN albums AS a
ON s.album_id = a.album_id;

ALTER TABLE songs
ADD COLUMN single_id CHAR(4);

ALTER TABLE songs
ADD FOREIGN KEY (single_id) REFERENCES singles(sing_id);

#ALTER TABLE songs
#MODIFY song_id CHAR(3) auto_increment;

INSERT 
INTO songs (song_name, song_length, album_id, song_trackno, single_id)
VALUES ('Spies', '00:05:18', 1, 3, NULL),
('Sparks', '00:03:47', 1, 4, NULL),
('Yellow', '00:04:29', 1, 5, (SELECT sing_id FROM singles WHERE sing_name = 'Yellow')),
('Trouble', '00:04:31', 1, 6, NULL),
('Parachutes', '00:00:46', 1, 7, NULL),
( 'High Speed', '00:04:14', 1, 8, NULL),
('We Never Change', '00:04:09', 1, 9, NULL),
('Everything''s Not Lost / Life Is For Living', '00:07:17', 1, 10, NULL);

#DROP TABLE songs;

SELECT *
FROM songs;
 
 UPDATE songs
 SET single_id = 
	(CASE 
		WHEN ((single_id IS NULL) AND EXISTS (SELECT 1 FROM singles WHERE songs.song_name = singles.sing_name)) 
			THEN (SELECT sing_id FROM singles WHERE songs.song_name = singles.sing_name)
		WHEN EXISTS (SELECT 1 FROM singles WHERE songs.song_name = singles.sing_name) 
			THEN (SELECT sing_id FROM singles WHERE songs.song_name = singles.sing_name) 
	END);
    
SELECT * FROM singles;

INSERT 
INTO songs (song_name, song_length, album_id, song_trackno, single_id)
VALUES ('For You', '00:05:45', NULL, 2, 1),
	('Careful Where You Stand', '00:04:47', NULL, 3, 1),
    ('Help Is Round The Corner', '00:02:36', NULL, 2, 2),
    ('No More Keeping My Feet On The Ground', '00:04:31', NULL, 3, 2),
    ('Brothers And Sisters', '00:04:49', NULL, 2,3),
    ('You Only Live Twice', '00:04:06', NULL, 2, 4);
    
ALTER TABLE songs
RENAME COLUMN song_trackno to album_trackno;

ALTER TABLE songs
ADD COLUMN single_trackno  INT,
ADD COLUMN ep_id INT,
ADD COLUMN ep_trackno INT;

SELECT * FROM songs;

UPDATE songs
SET single_trackno = album_trackno
WHERE single_id IS NOT NULL; 

UPDATE songs
SET album_id = 3
WHERE song_name = 'Fix You';

UPDATE songs 
SET album_trackno = null
WHERE album_id IS NULL;

UPDATE songs
SET single_trackno = 1
WHERE (single_id IS NOT NULL AND album_id IS NOT NULL);

ALTER TABLE songs
ADD FOREIGN KEY (EP_id) REFERENCES eps(ep_id);

SELECT * FROM singles;

INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('Politik', '00:05:18', 2, 1, NULL, NULL),
	('In My Place', '00:03:48', 2, 2, 5, 1),
    ('God Put A Smile Upon Your Face', '00:04:57', 2, 3, 8, 1),
    ('The Scientist', '00:05:09', 2, 4, 6, 1),
    ('Clocks', '00:05:07', 2, 5, 7, 1),
    ('Daylight', '00:05:27', 2, 6, NULL, NULL),
    ('Green Eyes', '00:03:43', 2, 7, NULL, NULL),
    ('Warning Sign', '00:05:31', 2, 8, NULL, NULL),
    ('A Whisper', '00:04:02', 2, 9, NULL, NULL),
    ('A Rush Of Blood To The Head', '00:05:51', 2, 10, NULL, NULL),
    ('Amsterdam', '00:05:19', 2, 11, NULL, NULL),
    ('One I Love', '00:04:35', NULL, NULL, 5, 2),
    ('I Bloom Blaum', '00:02:11', NULL, NULL, 5, 3),
    ('1.36', '00:02:05', NULL, NULL, 6, 2),
    ('I Ran Away', '00:04:26', NULL, NULL, 6, 3),
    ('Crests Of Waves', '00:03:39', NULL, NULL, 7, 2),
    ('Animals', '00:05:32', NULL, NULL, 7, 3),
    ('Murder', '00:05:36', NULL, NULL, 8, 2);
    
INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ( 'Square One', '00:04:47', 3, 1, NULL, NULL),
	('What If', '00:04:57', 3, 2, NULL, NULL),
    ('White Shadows', '00:05:28', 3, 3, NULL, NULL),
    ('Talk', '00:05:11', 3, 5, 11, 1),
    ('X&Y', '00:04:34', 3, 6, NULL, NULL),
    ('Speed Of Sound', '00:04:48', 3, 7, 9, 1),
    ('A Message', '00:04:45', 3, 8, NULL, NULL),
    ('Low', '00:05:32', 3, 9, NULL, NULL),
    ('The Hardest Part', '00:04:25', 3, 10, 12, 1),
    ('Swallowed In The Sea', '00:03:58', 3, 11, NULL, NULL),
    ('Twisted Logic', '00:05:01', 3, 12, NULL, NULL),
    ('Til Kingdom Come', '00:04:10', 3, 13, NULL, NULL),
    ('Things I Don''t Understand', '00:04:55', NULL, NULL, 9, 2),
    ('Proof', '00:04:10', NULL, NULL, 9, 3),
    ('The World Turned Upside Down', '00:04:32', NULL, NULL, 10, 2),
    ('Pour Me', '00:05:01', NULL, NULL, 10, 3),
    ('Sleeping Sun', '00:03:09', NULL, NULL, 11, 2),
    ('Gravity', '00:06:12', NULL, NULL, 11, 2),
    ('How You See The World', '00:04:16', NULL, NULL, 12, 2);
    
   UPDATE songs
   SET single_id = 10 
   WHERE song_name = 'Fix You';
   
   UPDATE songs
   SET single_trackno = 1 
   WHERE song_name = 'Fix You';   
   
   INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('Life In Technicolor', '00:02:30', 4, 1, NULL, NULL),
	('Cemeteries Of London', '00:03:21', 4, 2, NULL, NULL),
    ('Lost!', '00:03:55', 4, 3, 16, 1),
    ('42', '00:03:57', 4, 4, NULL, NULL),
    ('Lovers In Japan / Reign Of Love', '00:06:51', 4, 5, 15, 1),
    ('Yes / Chinese Sleep Chant', '00:07:06', 4, 6, NULL, NULL),
    ('Viva La Vida', '00:04:01', 4, 7, 14, 1),
    ('Violet Hill', '00:03:42', 4, 8, 13, 1),
    ('Strawberry Swing', '00:04:09', 4, 9, 17, 1),
    ('Death And All His Friends', '00:06:18', 4, 10, NULL, NULL),
    ('A Spell A Rebel Yell', '00:02:47', NULL, NULL, 13, 2),
    ('Death Will Never Conquer', '00:01:18', NULL, NULL, 14, 2),
    ('Lost?', '00:03:42', NULL, NULL, 16, 2),
    ('Lost@', '00:03:55', NULL, NULL, 16, 3),
    ('Lost+', '00:04:16', NULL, NULL, 16, 4),
    ('The Goldrush', '00:02:29', NULL, NULL, 18, 3);

   INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('Mylo Xyloto', '00:00:43', 5, 1, NULL, NULL),
	('Hurts Like Heaven', '00:04:02', 5, 2, 23, 1),
    ('Paradise', '00:04:37', 5, 3, 20, 1),
    ('Charlie Brown', '00:04:45', 5, 4, 21, 1),
    ('Us Against The World', '00:03:59', 5, 5, NULL, NULL),
    ('M.M.I.X.', '00:00:49', 5, 6, NULL, NULL),
    ('Every Teardrop Is A Waterfall', '00:04:00', 5, 7, 19, 1),
    ('Major Minus', '00:03:30', 5, 8, 19, 2),
    ('U.F.O.', '00:02:17', 5, 9, NULL, NULL),
    ('Princess Of China', '00:03:59', 5, 10, 22, 1),
    ('Up In Flames', '00:03:13', 5, 11, NULL, NULL),
    ('A Hopeful Transmission', '00:00:33', 5, 12, NULL, NULL),
    ('Don''t Let It Break Your Heart', '00:03:54', 5, 13, NULL, NULL),
    ('Up With The Birds', '00:03:45', 5, 14, NULL, NULL);
    
   INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('Always In My Head', '00:03:36', 6, 1, NULL, NULL),
	('Magic', '00:04:45', 6, 2, 24, 1),
    ('Ink', '00:03:48', 6, 3, 28, 1),
    ('True Love', '00:04:05', 6, 4, 27, 1),
    ('Midnight', '00:04:54', 6, 5, 25, 1),
    ('Another''s Arms', '00:03:54', 6, 6, NULL, NULL),
    ('Oceans', '00:05:21', 6, 7, NULL, NULL),
    ('A Sky Full Of Stars', '00:04:28', 6, 8, 26, 1),
    ('O', '00:07:47', 6, 9, NULL, NULL);
    
   INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('A Head Full Of Dreams', '00:03:43', 7, 1, 32, 1),
		('Birds', '00:03:49', 7, 2, NULL, NULL),
        ('Hymn For The Weekend', '00:04:18', 7, 3, 30, 1),
        ('Everglow', '00:04:42', 7, 4, 33, 1),
        ('Adventure Of A Lifetime', '00:04:23', 7, 5, 29, 1),
        ('Fun', '00:04:27', 7, 6, NULL, NULL),
        ('Kaleidoscope', '00:01:51', 7, 7, NULL, NULL),
        ('Army Of One / X Marks The Spot', '00:06:16', 7, 8, NULL, NULL),
        ('Amazing Day', '00:04:31', 7, 9, NULL, NULL),
        ('Colour Spectrum', '00:01:00', 7, 10, NULL, NULL),
        ('Up&Up', '00:06:45', 7, 11, 31, 1);
        
   INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('Sunrise', '00:02:31', 8, 1, NULL, NULL),
	('Church', '00:03:50', 8, 2, NULL, NULL),
    ('Trouble In Town', '00:04:38', 8, 3, NULL, NULL),
    ('Broken', '00:04:58', 8, 4, NULL, NULL),
    ('Daddy', '00:04:58', 8, 5, NULL, NULL),
    ('WOTW / POTP', '00:01:16', 8, 6, NULL, NULL),
    ('Arabesque', '00:05:40', 8, 7, 34, 2),
    ('When I Need A Friend', '00:02:35', 8, 8, NULL, NULL),
    ('Guns', '00:01:55', 8, 9, NULL, NULL),
    ('Orphans', '00:03:17', 8, 10, 34, 1),
    ('Èkó', '00:02:37', 8, 11, NULL, NULL),
    ('Cry Cry Cry', '00:02:47', 8, 12, NULL, NULL),
    ('Old Friends', '00:02:26', 8, 13, NULL, NULL),
    ('بنی آدم', '00:03:14', 8, 14, NULL, NULL),
    ('Champion Of The World', '00:04:17', 8, 15, 36, 1),
    ('Everyday Life', '00:04:18', 8, 16, 35, 1);
    
 SELECT * FROM eps;  
   
INSERT INTO songs (song_name, song_length, single_id, single_trackno, ep_id, ep_trackno)
VALUES ('Atlas', '00:03:56', 37, 1, NULL, NULL),
	('Miracles', '00:03:56', 38, 1, NULL, NULL),
    ('Something Just Like This', '00:04:07', 39, 1, NULL, NULL),
    ('Flags', '00:03:36', 40, 1, NULL, NULL),
    ('Life In Technicolor II', '00:04:05', 18, 1, 1, 1),
    ('Postcards From Far Away', '00:00:48', NULL, NULL, 1, 2),
    ('Glass Of Water', '00:04:44', NULL, NULL, 1, 3),
    ('Rainy Day', '00:03:26', NULL, NULL, 1, 4),
    ('Prospekt''s March / Poppyfields', '00:03:38', NULL, NULL, 1, 5),
    ('Lovers In Japan (Osaka Sun Mix)', '00:03:58', NULL, NULL, 1, 7),
    ('Now My Feet Won''t Touch The Ground', '00:02:29', NULL, NULL, 1, 8);
    
 UPDATE songs
   SET ep_id = 1
   WHERE song_name = 'Lost+';
   
   UPDATE songs
   SET ep_trackno = 6 
   WHERE song_name = 'Lost+';      
   
 INSERT INTO songs (song_name, song_length, single_id, single_trackno, ep_id, ep_trackno)
VALUES  ('All I Can Think About Is You', '00:04:34',  NULL, NULL, 2, 1),
	('Miracles (Someone Special)', '00:04:36', NULL, NULL, 2, 2),
    ('A L I E N S', '00:04:42', NULL, NULL, 2, 3),
    ('Something Just Like This (Tokyo Remix)', '00:04:34', NULL, NULL, 2, 4),
    ('Hypnotised (EP Mix)', '00:06:31', NULL, NULL, 2, 5), 
    ('Moving To Mars', '00:04:18', NULL, NULL, 4, 3),
    ('All Your Friends', '00:03:32', NULL, NULL, 5, 2),
    ('Ghost Story', '00:04:17', NULL, NULL, 5, 3),
    ('O (Reprise)', '00:01:37', NULL, NULL, 5, 4),
    ('Bigger Stronger', '00:04:49', NULL, NULL, 3, 1),
    ('See You Soon', '00:02:52', NULL, NULL, 3, 3),
    ('Such A Rush', '00:04:57', NULL, NULL, 3, 5),
    ('E-Lo', '00:03:34', NULL, NULL, 6, 2),
    ('Timbuktu', '00:03:44', NULL, NULL, 6, 3),
    ('Voodoo', '00:03:57', NULL, NULL, 6, 4);
    
 UPDATE songs
 SET ep_id = 4, ep_trackno = 1
 WHERE song_name = 'Every Teardrop Is A Waterfall';
 
UPDATE songs
SET ep_id = 4, ep_trackno = 2
WHERE song_name = 'Major Minus';

UPDATE songs
SET ep_id = 3, ep_trackno = 2
WHERE song_name = 'Don''t Panic';

UPDATE songs
SET ep_id = 3, ep_trackno = 4
WHERE song_name = 'High Speed';

UPDATE songs
SET ep_id = 5, ep_trackno = 1
WHERE song_name = 'A Sky Full Of Stars';

   INSERT INTO songs (song_name, song_length, album_id, album_trackno, single_id, single_trackno)
VALUES ('Music Of The Spheres', '00:00:53', 9, 1, 41, 1),
	('Higher Power', '00:03:26', 9, 2, NULL, NULL),
    ('Humankind', '00:04:26', 9, 3, NULL, NULL),
    ('Alien Choir', '00:00:53', 9, 4, NULL, NULL),
    ('Let Somebody Go', '00:04:01', 9, 5, 43, 1),
    ('Human Heart', '00:03:08', 9, 6, NULL, NULL),
    ('People Of The Pride', '00:03:37', 9, 7, NULL, NULL),
    ('Biutyful', '00:03:12', 9, 8, NULL, NULL),
    ('Music Of The Spheres II', '00:00:21', 9, 9, NULL, NULL),
    ('My Universe', '00:03:46', 9, 10, 42, 1),
    ('Infinity Sign', '00:03:46', 9, 11, NULL, NULL),
    ('Coloratura', '00:10:17', 9, 12, NULL, NULL)
 ;
 
 UPDATE songs
 SET single_id = NULL 
 WHERE song_name = 'Music Of The Spheres';
 
  UPDATE songs
 SET single_trackno = NULL 
 WHERE song_name = 'Music Of The Spheres';
 
UPDATE songs
 SET single_id = 41 
 WHERE song_name = 'Higher Power';
 
 UPDATE songs
 SET single_trackno = 1 
 WHERE song_name = 'Higher Power';
 
 SELECT * FROM songs
 WHERE album_id = 9;