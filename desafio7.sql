SELECT
ar.artist_name as artista, al.album_name as album, COUNT(f.id_user_FK) as seguidores
FROM SpotifyClone.Artist ar
JOIN SpotifyClone.Album al on ar.id_artist = al.id_artist_FK
JOIN SpotifyClone.Favorites f on ar.id_artist = f.id_artist_FK
GROUP BY ar.artist_name, al.album_name
ORDER BY seguidores DESC, ar.artist_name, al.album_name;
