SELECT song_name, (extract(MINUTE FROM song_length)*60 + extract(SECOND FROM song_length)) AS duration_seconds
FROM songs
ORDER BY duration_seconds
LIMIT 10;

SELECT song_name, (extract(MINUTE FROM song_length)*60 + extract(SECOND FROM song_length)) AS duration_seconds
FROM songs
ORDER BY duration_seconds DESC
LIMIT 10;

SELECT albums.album_name, COUNT(*) 
FROM songs
INNER JOIN albums
ON songs.album_id = albums.album_id
GROUP BY album_name;

SELECT albums.album_name, AVG((extract(MINUTE FROM songs.song_length)*60 + extract(SECOND FROM songs.song_length))) AS avg_length
FROM songs
INNER JOIN albums
ON songs.album_id = albums.album_id
GROUP BY album_name;



