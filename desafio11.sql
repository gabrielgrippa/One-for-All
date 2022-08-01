SELECT
s.song_name as nome_musica,
CASE
WHEN s.song_name LIKE '%Streets' THEN REPLACE(s.song_name, 'Streets', 'Code Review')
WHEN s.song_name LIKE '%Her Own' THEN REPLACE(s.song_name, 'Her Own', 'Trybe')
WHEN s.song_name LIKE '%Inner Fire' THEN REPLACE(s.song_name, 'Inner Fire', 'Project')
WHEN s.song_name LIKE '%Silly' THEN REPLACE(s.song_name, 'Silly', 'Nice')
WHEN s.song_name LIKE '%Circus' THEN REPLACE(s.song_name, 'Circus', 'Pull Request')
END as novo_nome
FROM SpotifyClone.Songs s
ORDER BY novo_nome ASC LIMIT 5 OFFSET 35;
