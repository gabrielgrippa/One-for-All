SELECT
COUNT(h.id_user_fk) as quantidade_musicas_no_historico
FROM SpotifyClone.Users u
JOIN SpotifyClone.History h on u.id_user = h.id_user_FK
WHERE u.user_name = 'Bill';
