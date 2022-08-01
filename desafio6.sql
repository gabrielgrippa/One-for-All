SELECT
MIN(p.price) as faturamento_minimo, MAX(p.price) as faturamento_maximo, ROUND(AVG(p.price), 2) as faturamento_medio, SUM(p.price) as faturamento_total
FROM SpotifyClone.Users u
JOIN SpotifyClone.Plans p on u.id_plan_FK = p.id_plan;
