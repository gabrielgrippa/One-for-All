SELECT
ar.artist_name as artista, al.album_name as album
FROM SpotifyClone.Artist ar
JOIN SpotifyClone.Album al on ar.id_artist = al.id_artist_FK
WHERE ar.artist_name LIKE "Walter Phoenix"
GROUP BY ar.artist_name, al.album_name
ORDER BY al.album_name;
