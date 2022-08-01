SELECT
s.song_name as nome, COUNT(h.id_song_FK) as reproducoes
FROM SpotifyClone.Users u
JOIN SpotifyClone.History h on u.id_user = h.id_user_FK
JOIN SpotifyClone.Plans p on u.id_plan_FK = p.id_plan
JOIN SpotifyClone.Songs s on s.id_song = h.id_song_FK
WHERE p.plan_name = 'gratuito' OR p.plan_name = 'pessoal'
GROUP BY nome
ORDER BY nome;
