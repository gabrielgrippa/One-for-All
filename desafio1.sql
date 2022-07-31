DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Plans(
	id_plan int auto_increment primary key not null unique,
    plan_name varchar(64) not null unique,
    price decimal(3,2) not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.Users(
	id_user int auto_increment primary key not null unique,
    user_name varchar(64) not null,
    joining_date date not null,
    age int not null,
    id_plan_FK int,
    FOREIGN KEY (id_plan_FK) REFERENCES Plans(id_plan)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Artist(
	id_artist int auto_increment primary key not null unique,
    artist_name varchar(64) not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.Album(
	id_album int auto_increment primary key not null unique,
    album_name varchar(64) not null,
    release_year year not null,
    id_artist_FK int,
    FOREIGN KEY (id_artist_FK) REFERENCES Artist(id_artist)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Songs(
	id_song int auto_increment primary key not null unique,
    song_name varchar(64) not null,
    duration int not null,
    id_album_FK int,
    FOREIGN KEY (id_album_FK) REFERENCES Album(id_album)
) engine = InnoDB;

CREATE TABLE SpotifyClone.History(
	id_history int auto_increment not null unique,
    play_date datetime not null,
    id_song_FK int,
    FOREIGN KEY (id_song_FK) REFERENCES Songs(id_song),
    id_user_FK int,
    FOREIGN KEY (id_user_FK) REFERENCES Users(id_user),
    constraint primary key(id_song_FK, id_user_FK)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Favorites(
	id_favorite int auto_increment not null unique,
    id_user_FK int,
    FOREIGN KEY (id_user_FK) REFERENCES Users(id_user),
    id_artist_FK int,
    FOREIGN KEY (id_artist_FK) REFERENCES Artist(id_artist),
    constraint primary key(id_user_FK, id_artist_FK)
) engine = InnoDB;

INSERT INTO SpotifyClone.Plans (plan_name, price)
VALUES
	('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.Users (user_name, joining_date, age, id_plan_FK)
VALUES
	('Thati', "2019-10-20", 23, 1),
    ('Cintia', "2017-12-30", 35, 2),
    ('Bill', "2019-06-05", 20, 3),
    ('Roger', "2020-05-13", 45, 4),
    ('Norman', "2017-02-17", 58, 4),
    ('Patrick', "2017-01-06", 33, 2),
    ('Vivian', "2018-01-05", 26, 3),
    ('Carol', "2018-02-14", 19, 3),
    ('Angelina', "2018-04-29", 42, 2),
    ('Paul', "2017-01-17", 46, 2);

INSERT INTO SpotifyClone.Artist (artist_name)
	VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');
    
INSERT INTO SpotifyClone.Album (album_name, release_year, id_artist_FK)
	VALUES
    ('Envious', 1990, 1),
    ('Exuberant', 1993, 1),
    ('Hallowed Steam', 1995, 2),
    ('Incandescent', 1998, 3),
    ('Temporary Culture', 2001, 4),
    ('Library of liberty', 2003, 4),
    ('Chained Down', 2007, 5),
    ('Cabinet of fools', 2012, 5),
    ('No guarantees', 2015, 5),
    ('Apparatus', 2015, 6);

INSERT INTO SpotifyClone.Songs (song_name, duration, id_album_FK)
	VALUES
    ("Soul For Us", 200, 1),
    ("Reflections Of Magic", 163, 1),
    ("Dance With Her Own", 116, 1),
	("Troubles Of My Inner Fire", 203, 2),
    ("Time Firework", 152, 2),
	("Magic Circus", 105, 3),
    ("Honey, So Do I", 207, 3),
    ("Sweetie, Let's Go Wild", 139, 3),
    ("She Knows", 244, 3),
	("Fantasy For Me", 100, 4),
    ("Celebration Of More", 146, 4),
    ("Rock His Everything", 223, 4),
    ("Home Forever", 231, 4),
    ("Diamond Power", 241, 4),
    ("Let's Be Silly", 132, 4),
	("Thang Of Thunder", 240, 5),
    ("Words Of Her Life", 185, 5),
    ("Without My Streets", 176, 5),
	("Need Of The Evening", 190, 6),
    ("History Of My Roses", 222, 6),
    ("Without My Love", 111, 6),
    ("Walking And Game", 123, 6),
    ("Young And Father", 197, 6),
	("Finding My Traditions", 179, 7),
    ("Walking And Man", 229, 7),
    ("Hard And Time", 135, 7),
    ("Honey, I'm A Lone Wolf", 150, 7),
	("She Thinks I Won't Stay Tonight", 166, 8),
    ("He Heard You're Bad For Me", 154, 8),
    ("He Hopes We Can't Stay", 210, 8),
    ("I Know I Know", 117, 8),
	("He's Walking Away", 159, 9),
    ("He's Trouble", 138, 9),
    ("I Heard I Want To Bo Alone", 120, 9),
    ("I Ride Alone", 151, 9),
	("Honey", 79, 10),
    ("You Cheated On Me", 95, 10),
    ("Wouldn't It Be Nice", 213, 10),
    ("Baby", 136, 10),
    ("You Make Me Feel So..", 83, 10);
    
INSERT INTO SpotifyClone.History (play_date, id_song_fk, id_user_FK)
	VALUES
    ("2020-02-28 10:45:55", 36, 1),
	("2020-05-02 05:30:35", 25, 1),
	("2020-03-06 11:22:33", 23, 1),
	("2020-08-05 08:05:17", 14, 1),
	("2020-09-14 16:32:22", 15, 1),
	("2020-01-02 07:40:33", 34, 2),
	("2020-05-16 06:16:22", 24, 2),
	("2020-10-09 12:27:48", 21, 2),
	("2020-09-21 13:14:46", 39, 2),
	("2020-11-13 16:55:13", 6, 3),
	("2020-12-05 18:38:30", 3, 3),
	("2020-07-30 10:00:00", 26, 3),
	("2021-08-15 17:10:10", 2, 4),
	("2021-07-10 15:20:30", 35, 4),
	("2021-01-09 01:44:33", 27, 4),
	("2020-07-03 19:33:28", 7, 5),
	("2017-02-24 21:14:22", 12, 5),
	("2020-08-06 15:23:43", 14, 5),
	("2020-11-10 13:52:27", 1, 5),
	("2019-02-07 20:33:48", 38, 6),
	("2017-01-24 00:31:17", 29, 6),
	("2017-10-12 12:35:20", 30, 6),
	("2018-05-29 14:56:41", 22, 6),
	("2018-05-09 22:30:49", 5, 7),
	("2020-07-27 12:52:58", 4, 7),
	("2018-01-16 18:40:43", 11, 7),
	("2018-03-21 16:56:40", 39, 8),
	("2020-10-18 13:38:05", 40, 8),
	("2019-05-25 08:14:03", 32, 8),
	("2021-08-15 21:37:09", 33, 8),
	("2021-05-24 17:23:45", 16, 9),
	("2018-12-07 22:48:52", 17, 9),
	("2021-03-14 06:14:26", 8, 9),
	("2020-04-01 03:36:00", 9, 9),
	("2017-02-06 08:21:34", 20, 10),
	("2017-12-04 05:33:43", 21, 10),
	("2017-07-27 05:24:49", 12, 10),
	("2017-12-25 01:03:57", 13, 10);
    
INSERT INTO SpotifyClone.Favorites (id_user_fk, id_artist_FK)
	VALUES
	(1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);
