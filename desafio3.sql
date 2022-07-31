SELECT
u.user_name as usuario, COUNT(h.id_user_FK) as qtde_musicas_ouvidas, ROUND(SUM(s.duration)/60, 2) as total_minutos
FROM SpotifyClone.Users u
JOIN SpotifyClone.History h on u.id_user = h.id_user_FK
JOIN SpotifyClone.Songs s on h.id_song_FK = s.id_song
GROUP BY u.user_name;
