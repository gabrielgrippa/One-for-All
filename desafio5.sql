SELECT
s.song_name as cancao, COUNT(h.id_song_FK) as reproducoes
FROM SpotifyClone.Songs s
JOIN SpotifyClone.History h on s.id_song = h.id_song_FK
GROUP BY s.song_name
ORDER BY reproducoes DESC, s.song_name LIMIT 2;
