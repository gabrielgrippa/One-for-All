SELECT COUNT(s.song_name) as cancoes, COUNT(distinct ar.id_artist) as artistas, COUNT(distinct al.id_album) as albuns FROM SpotifyClone.Songs s 
JOIN SpotifyClone.Album al on al.id_album = s.id_album_FK
JOIN SpotifyClone.Artist ar on ar.id_artist = al.id_artist_FK;
