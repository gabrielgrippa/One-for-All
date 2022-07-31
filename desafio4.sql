SELECT
u.user_name as usuario, IF(MAX(h.play_date) >= "2021", "Usuário ativo", "Usuário inativo") as condicao_usuario
FROM SpotifyClone.Users u
JOIN SpotifyClone.History h on u.id_user = h.id_user_FK
GROUP BY u.user_name
ORDER BY u.user_name;
