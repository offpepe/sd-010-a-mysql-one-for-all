DROP DATABASE IF EXISTS SpotfyClone;

CREATE DATABASE SpotifyClone;

  USE SpotifyClone;

CREATE TABLE `PLAN`(
PLAN_ID INT(11) PRIMARY KEY NOT NULL auto_increment,
PLAN_NAME VARCHAR(250)
)ENGINE=InnoDB;

INSERT INTO `PLAN`(PLAN_NAME)
VALUES ('gratuito'),
('familiar'),
('universitário');

CREATE TABLE `ARTIST` (
ARTIST_ID INT(11) PRIMARY KEY NOT NULL auto_increment,
ARTIST_NAME VARCHAR(250)
)ENGINE=InnoDB;

INSERT INTO `ARTIST`(ARTIST_NAME)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE `USER`(
  `USER_ID` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `NAME` VARCHAR(250),
  `AGE` INT(3),
  `PLAN_ID` INT(11) NOT NULL,  
  FOREIGN KEY(PLAN_ID) REFERENCES PLAN(PLAN_ID)
)ENGINE=InnoDB;

INSERT INTO `USER`(`NAME`,AGE,PLAN_ID)
VALUES ('Thati',23,1),
('Cintia',35,2),
('Bill',20,3),
('Roger',45,1);

CREATE TABLE `ALBUM`(
`ALBUM_ID` INT(11) NOT NULL PRIMARY KEY auto_increment,
`ALBUM_NAME` VARCHAR(250) NOT NULL,
`ARTIST_ID` INT(11) NOT NULL,
FOREIGN KEY(`ARTIST_ID`) REFERENCES ARTIST(ARTIST_ID)
)ENGINE=InnoDB;

INSERT INTO `ALBUM`(ALBUM_NAME,ARTIST_ID)
VALUES ('Envious',1),
('Exuberant',1),
('Hallowed Steam',2),
('Incandescent',3),
('Temporary Culture',4);

CREATE TABLE `MUSIC`(
MUSIC_ID INT(11) NOT NULL PRIMARY KEY auto_increment,
MUSIC_NAME VARCHAR(250),
ARTIST_ID INT(11) NOT NULL,
ALBUM_ID INT(11) NOT NULL,
FOREIGN KEY (`ARTIST_ID`) REFERENCES ARTIST(ARTIST_ID),
FOREIGN KEY (`ALBUM_ID`) REFERENCES ALBUM(ALBUM_ID)
)ENGINE=InnoDB;

INSERT INTO `MUSIC`(MUSIC_NAME,ARTIST_ID,ALBUM_ID)
VALUES ('Soul For Us',1,1),('Reflections Of Magic',1,1),('Dance With Her Own',1,1),
('Troubles Of My Inner Fire',1,2),('Time Fireworks',1,2),('Magic Circus',2,3),('Honey, So Do I',2,3),
("Sweetie, Let's Go Wil",2,3),('She Knows',2,3),('Fantasy For Me',3,4),
('Celebration Of More',3,4),('Rock His Everything',3,4),('Home Forever',3,4),
('Diamond Power',3,4),("Honey, Let's Be Silly",3,4),('Thang Of Thunder',4,5),
('Words Of Her Life',4,5),('Without My Streets',4,5);

CREATE TABLE `HISTORY_MUSIC`(
USER_ID INT(11) NOT NULL,
MUSIC_ID INT(11) NOT NULL,
FOREIGN KEY (USER_ID) REFERENCES `USER`(USER_ID),
FOREIGN KEY (MUSIC_ID) REFERENCES `MUSIC`(MUSIC_ID),
PRIMARY KEY (USER_ID,MUSIC_ID)
)ENGINE=InnoDB;

INSERT INTO HISTORY_MUSIC (USER_ID,MUSIC_ID)
VALUES (1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),
(3,6),(4,3),(4,18),(4,11);

CREATE TABLE `FOLLOWED_ARTISTS`(
USER_ID INT(11) NOT NULL,
ARTIST_ID INT(11) NOT NULL,
FOREIGN KEY (ARTIST_ID) REFERENCES ARTIST(ARTIST_ID),
FOREIGN KEY (USER_ID) REFERENCES `USER`(USER_ID),
PRIMARY KEY (USER_ID,ARTIST_ID)
)ENGINE=InnoDB;

INSERT INTO `FOLLOWED_ARTISTS`(USER_ID,ARTIST_ID)
VALUES(1,1),(1,3),(1,4),(2,1),(2,3),(3,2),(3,1),(4,4);
