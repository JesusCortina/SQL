SELECT * 
FROM songs;

#QUERY THAT RETURNS SONGS AND LENGTHS FROM ALL ALBUM SONGS
SELECT song_name AS Song,
	song_length AS Duration
FROM songs
WHERE album_id IS NOT NULL
ORDER BY album_id, album_trackno;
 
 
 #A query that return the release date of all album songs
 SELECT so.song_name AS Song,
	al.album_name AS Album,
    al.album_rdate AS Release_Date
FROM songs AS so
INNER JOIN albums AS al
ON so.album_id = al.album_id
ORDER BY so.album_id, so.album_trackno;

#The same but now for singles
 SELECT so.song_name AS Song,
	si.sing_name AS Single,
    si.sing_rdate AS Release_Date
FROM songs AS so
INNER JOIN singles AS si
ON so.single_id = si.sing_id
ORDER BY si.sing_rdate, so.single_trackno ASC;

#Now for EPS
 SELECT so.song_name AS Song,
	e.ep_name AS EP,
    e.ep_rdate AS Release_Date
FROM songs AS so
INNER JOIN eps AS e
ON so.ep_id = e.ep_id
ORDER BY e.ep_rdate, so.ep_trackno ASC;

#Let's save them all in views
CREATE VIEW album_view 
	(Song, Album, Release_Date) AS 
     SELECT so.song_name AS Song,
	al.album_name AS Album,
    al.album_rdate AS Release_Date
	FROM songs AS so
	INNER JOIN albums AS al
	ON so.album_id = al.album_id
	ORDER BY so.album_id, so.album_trackno;
    
SELECT *
FROM album_view;


CREATE VIEW ep_view
	(Song, EP, Release_Date) AS
    SELECT so.song_name AS Song,
		e.ep_name AS EP,
        e.ep_rdate AS Release_Date	
    FROM songs AS so
    INNER JOIN eps AS e
    ON so.ep_id = e.ep_id
    ORDER BY e.ep_rdate, so.ep_trackno ASC;
    
 CREATE VIEW single_view
	(Song, Single, Release_Date) AS 
     SELECT so.song_name AS Song,
	si.sing_name AS Single,
    si.sing_rdate AS Release_Date
	FROM songs AS so
	INNER JOIN singles AS si
	ON so.single_id = si.sing_id
	ORDER BY si.sing_rdate, so.single_trackno ASC;
    
 #Now there is a problem. Some songs were released prior to the album release. So, we want to show the earliest release date for a song
SELECT so.song_name AS Song,
		al.album_rdate AS Release_DateA
FROM songs AS so
LEFT JOIN albums AS al
ON so.album_id = al.album_id
ORDER BY al.album_rdate ASC;

SELECT so.song_name AS Song,
		al.album_rdate AS Release_DateA,
        e.ep_rdate AS Release_DateE
FROM songs AS so
LEFT JOIN albums AS al
	ON so.album_id = al.album_id
LEFT JOIN eps AS e
	ON so.ep_id = e.ep_id
ORDER BY al.album_rdate, e.ep_rdate ASC;		

SELECT so.song_name AS Song,
		al.album_rdate AS Release_DateA,
        e.ep_rdate AS Release_DateE,
        si.sing_rdate AS Release_DateS
FROM songs AS so
LEFT JOIN albums AS al
	ON so.album_id = al.album_id
LEFT JOIN eps AS e
	ON so.ep_id = e.ep_id
LEFT JOIN singles AS si
	ON so.single_id = si.sing_id	
ORDER BY al.album_rdate, e.ep_rdate, si.sing_rdate ASC;


		#WHEN (so.sing_id IS NULL AND (so.album_id IS NOT NULL AND so.ep_id IS NOT NULL))
			#THEN (CASE
					#HEN (

#PART 1
SELECT so.song_name AS Song,
	(CASE
		WHEN (so.album_id IS NOT NULL AND (so.single_id IS NULL AND so.ep_id IS NULL))
			THEN al.album_rdate
		WHEN (so.single_id IS NOT NULL AND (so.album_id IS NULL AND so.ep_id IS NULL))
			THEN si.sing_rdate
		WHEN (so.ep_id IS NOT NULL AND (so.single_id IS NULL AND so.album_id IS NULL))
			THEN e.ep_rdate
		ELSE
			'HAPPY'
        END    
) AS Release_Date_To_Public
FROM songs AS so
LEFT JOIN albums AS al
	ON so.album_id = al.album_id
LEFT JOIN eps AS e
	ON so.ep_id = e.ep_id
LEFT JOIN singles AS si
	ON so.single_id = si.sing_id;

#Part2


SELECT so.song_name AS Song,
	(CASE
		WHEN (so.album_id IS NOT NULL AND (so.single_id IS NULL AND so.ep_id IS NULL))
			THEN al.album_rdate
		WHEN (so.single_id IS NOT NULL AND (so.album_id IS NULL AND so.ep_id IS NULL))
			THEN si.sing_rdate
		WHEN (so.ep_id IS NOT NULL AND (so.single_id IS NULL AND so.album_id IS NULL))
			THEN e.ep_rdate
        WHEN (so.single_id IS NULL AND (so.album_id IS NOT NULL AND so.ep_id IS NOT NULL))
			THEN (CASE
					WHEN (al.album_rdate < e.ep_rdate)
						THEN al.album_rdate
					ELSE 
						e.ep_rdate
					END)
		 WHEN (so.album_id IS NULL AND (so.single_id IS NOT NULL AND so.ep_id IS NOT NULL))
			THEN (CASE
					WHEN (si.sing_rdate < e.ep_rdate)
						THEN si.sing_rdate
					ELSE 
						e.ep_rdate
					END)  
		WHEN (so.ep_id IS NULL AND (so.album_id IS NOT NULL AND so.single_id IS NOT NULL))
			THEN (CASE
					WHEN (al.album_rdate < si.sing_rdate)
						THEN al.album_rdate
					ELSE 
						si.sing_rdate
					END)
		ELSE
			'HAPPY'
        END    
) AS Release_Date_To_Public
FROM songs AS so
LEFT JOIN albums AS al
	ON so.album_id = al.album_id
LEFT JOIN eps AS e
	ON so.ep_id = e.ep_id
LEFT JOIN singles AS si
	ON so.single_id = si.sing_id;  
    
 #PART 3
 
 
 SELECT so.song_name AS Song,
	(CASE
		WHEN (so.album_id IS NOT NULL AND (so.single_id IS NULL AND so.ep_id IS NULL))
			THEN al.album_rdate
		WHEN (so.single_id IS NOT NULL AND (so.album_id IS NULL AND so.ep_id IS NULL))
			THEN si.sing_rdate
		WHEN (so.ep_id IS NOT NULL AND (so.single_id IS NULL AND so.album_id IS NULL))
			THEN e.ep_rdate
        WHEN (so.single_id IS NULL AND (so.album_id IS NOT NULL AND so.ep_id IS NOT NULL))
			THEN (CASE
					WHEN (al.album_rdate < e.ep_rdate)
						THEN al.album_rdate
					ELSE 
						e.ep_rdate
					END)
		 WHEN (so.album_id IS NULL AND (so.single_id IS NOT NULL AND so.ep_id IS NOT NULL))
			THEN (CASE
					WHEN (si.sing_rdate < e.ep_rdate)
						THEN si.sing_rdate
					ELSE 
						e.ep_rdate
					END)  
		WHEN (so.ep_id IS NULL AND (so.album_id IS NOT NULL AND so.single_id IS NOT NULL))
			THEN (CASE
					WHEN (al.album_rdate < si.sing_rdate)
						THEN al.album_rdate
					ELSE 
						si.sing_rdate
					END)
		ELSE
			(CASE
				WHEN (al.album_rdate < e.ep_rdate AND al.album_rdate < si.sing_rdate)
					THEN al.album_rdate
				WHEN (e.ep_rdate < al.album_rdate AND e.ep_rdate < si.sing_rdate)
					THEN e.ep_rdate
				ELSE
					si.sing_rdate
				END)
        END    
) AS Release_Date_To_Public
FROM songs AS so
LEFT JOIN albums AS al
	ON so.album_id = al.album_id
LEFT JOIN eps AS e
	ON so.ep_id = e.ep_id
LEFT JOIN singles AS si
	ON so.single_id = si.sing_id
ORDER BY Release_Date_To_Public; 
 

#Filtering by text and length

Select song_name, song_length
FROM songs
WHERE song_name IN (SELECT songs.song_name
	FROM songs 
    INNER JOIN albums
    ON songs.album_id = albums.album_id
    WHERE songs.album_id = 5); 

SELECT song_name, song_length
FROM songs
WHERE song_name NOT IN (SELECT song_name
	FROM songs
    WHERE album_id IS NOT NULL);
    
CREATE VIEW release_dates
	(Song, RDate) AS (
     SELECT so.song_name AS Song,
	(CASE
		WHEN (so.album_id IS NOT NULL AND (so.single_id IS NULL AND so.ep_id IS NULL))
			THEN al.album_rdate
		WHEN (so.single_id IS NOT NULL AND (so.album_id IS NULL AND so.ep_id IS NULL))
			THEN si.sing_rdate
		WHEN (so.ep_id IS NOT NULL AND (so.single_id IS NULL AND so.album_id IS NULL))
			THEN e.ep_rdate
        WHEN (so.single_id IS NULL AND (so.album_id IS NOT NULL AND so.ep_id IS NOT NULL))
			THEN (CASE
					WHEN (al.album_rdate < e.ep_rdate)
						THEN al.album_rdate
					ELSE 
						e.ep_rdate
					END)
		 WHEN (so.album_id IS NULL AND (so.single_id IS NOT NULL AND so.ep_id IS NOT NULL))
			THEN (CASE
					WHEN (si.sing_rdate < e.ep_rdate)
						THEN si.sing_rdate
					ELSE 
						e.ep_rdate
					END)  
		WHEN (so.ep_id IS NULL AND (so.album_id IS NOT NULL AND so.single_id IS NOT NULL))
			THEN (CASE
					WHEN (al.album_rdate < si.sing_rdate)
						THEN al.album_rdate
					ELSE 
						si.sing_rdate
					END)
		ELSE
			(CASE
				WHEN (al.album_rdate < e.ep_rdate AND al.album_rdate < si.sing_rdate)
					THEN al.album_rdate
				WHEN (e.ep_rdate < al.album_rdate AND e.ep_rdate < si.sing_rdate)
					THEN e.ep_rdate
				ELSE
					si.sing_rdate
				END)
        END    
) AS Release_Date_To_Public
FROM songs AS so
LEFT JOIN albums AS al
	ON so.album_id = al.album_id
LEFT JOIN eps AS e
	ON so.ep_id = e.ep_id
LEFT JOIN singles AS si
	ON so.single_id = si.sing_id
ORDER BY Release_Date_To_Public);


SELECT *
FROM release_dates
WHERE Rdate BETWEEN '2003-01-13' AND '2008-04-15';

SELECT * 
FROM release_dates
WHERE Rdate BETWEEN 
	(SELECT RDate FROM release_dates WHERE Song = 'Every Teardrop Is A Waterfall')
    AND
    (SELECT RDate FROM release_dates WHERE Song = 'Magic');
    
 #Matching
 SELECT *
 FROM songs
 WHERE RIGHT(song_name, 1) NOT IN ('a','e','i','o','u');

SELECT * FROM songs
WHERE lower(LEFT(song_name,1) IN ('m'));

SELECT song_name
FROM songs 
WHERE song_name LIKE '%/%' OR song_name LIKE '%(%)%';

SELECT song_name
FROM songs
ORDER BY LENGTH(song_name) DESC;

SELECT CONCAT(songs.song_name, ' from ', albums.album_name) AS Song_Album
FROM songs
INNER JOIN albums 
ON songs.album_id = albums.album_id
WHERE songs.album_id IS NOT NULL;