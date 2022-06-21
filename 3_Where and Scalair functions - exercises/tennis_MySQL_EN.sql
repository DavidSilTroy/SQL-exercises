
DROP TABLE IF EXISTS tennis.board_member;
DROP TABLE IF EXISTS tennis.fine;
DROP TABLE IF EXISTS tennis.competition;
DROP TABLE IF EXISTS tennis.team;
DROP TABLE IF EXISTS tennis.player;

DROP SCHEMA IF EXISTS tennis;
CREATE SCHEMA tennis;
USE tennis;

CREATE TABLE tennis.player
      (player_id   INT NOT NULL PRIMARY KEY,
       name         varchar(15) NOT NULL,
       initials  varchar(3) NOT NULL,
       birthdate    DATE,
       gender     CHAR(1) NOT NULL
                    CHECK(gender IN ('V','M')),
       member_since      SMALLINT NOT NULL
                    CHECK(member_since > 1989),
       street       VARCHAR(30)  NOT NULL,
       number       varchar(4),
       postal_code     varchar(6) CHECK(postal_code LIKE '____'),
       city       VARCHAR(30) NOT NULL,
       telephone     varchar(13),
       bond_number      varchar(4));

CREATE TABLE tennis.team
      (team_id       INT NOT NULL PRIMARY KEY,
       captain_id    INT NOT NULL,
       division      varchar(6) NOT NULL
                    CHECK(division IN ('first', 'second')),
       FOREIGN KEY  (captain_id) REFERENCES tennis.player (player_id));

CREATE TABLE tennis.competition
      (competition_id  INT NOT NULL PRIMARY KEY,
       team_id       INT NOT NULL,
       player_id    INT NOT NULL,
       winner_sets     SMALLINT NOT NULL
                    CHECK(winner_sets BETWEEN 0 AND 3),
       loser_sets     SMALLINT NOT NULL
                    CHECK(loser_sets BETWEEN 0 AND 3),
       FOREIGN KEY  (team_id) REFERENCES tennis.team (team_id),
       FOREIGN KEY  (player_id) REFERENCES tennis.player (player_id));

CREATE TABLE tennis.fine
      (fine_id  INT NOT NULL PRIMARY KEY,
       player_id    INT NOT NULL,
       date_fine       Date NOT NULL
                    CHECK(date_fine >= CAST('1999-12-31' AS Date)),
       amount_fine       DECIMAL(7,2) NOT NULL
                    CHECK(amount_fine > 0),
       FOREIGN KEY  (player_id) REFERENCES tennis.player (player_id));

CREATE TABLE tennis.board_member
      (player_id    INT NOT NULL,
       start_date  Date NOT NULL,
       end_date   Date,
       position      varchar(20),
       PRIMARY KEY  (player_id, start_date),
       FOREIGN KEY  (player_id) REFERENCES tennis.player (player_id),
       CHECK(start_date < end_date),
       CHECK(start_date >= CAST('2000-01-01' AS Date)));

INSERT INTO tennis.player VALUES (2, 'Engelen', 'R', '1997-09-01', 'M', 2008, 'Drijhoek',  '43', '2440', 'Geel', '070-237893', '2411');
INSERT INTO tennis.player VALUES ( 6, 'Peeters', 'R', '1998-06-25', 'M', 2008, 'Kleinhoefstraat', '80', '2440', 'Geel', '070-476537', '8467');
INSERT INTO tennis.player VALUES (7, 'Wijers', 'G', '1998-05-11', 'M', 2008, 'Markt', '39', '2440', 'Geel', '070-347689', NULL);
INSERT INTO tennis.player VALUES (8, 'Nagels', 'B', '2000-07-08', 'V', 2010, 'Gemeentestraat','4', '2460', 'Kasterlee', '070-458458', '2983');
INSERT INTO tennis.player VALUES (27, 'Cools', 'F', '1999-12-28', 'V', 2008, 'Spechtendreef',  '804', '2460', 'Lichtaart', '079-234857', '2513');
INSERT INTO tennis.player VALUES (28, 'Cools', 'C', '1998-06-22', 'V', 2009, 'Boskant', '10', '2275', 'Lille', '010-659599', NULL);
INSERT INTO tennis.player VALUES (39, 'Bellens', 'D', '2001-10-29', 'M', 2010, 'Anemoonstraat',  '78', '2440', 'Geel', '070-393435', NULL);
INSERT INTO tennis.player VALUES (44, 'Bakker, de', 'E', '1998-01-09', 'M', 2006, 'Kastanjelaan','23', '2460', 'Kasterlee', '070-368753', '1124');
INSERT INTO tennis.player VALUES (57, 'Gorp, van', 'M',  '2001-08-17', 'M', 2010, 'Markt','16', '2440', 'Geel', '070-473458', '6409');
INSERT INTO tennis.player VALUES (83, 'Henderickx', 'P', '2001-11-11', 'M', 2011, 'Blokstraat','16a', '2440', 'Geel', '070-353548', '1608');
INSERT INTO tennis.player VALUES (95, 'Melis', 'P', '1998-05-14', 'M', 2006, 'Gasthuisstraat', '33a', '2300', 'Turnhout', '070-867564', NULL);
INSERT INTO tennis.player VALUES (100, 'Peeters', 'P', '1998-02-28', 'M', 2007, 'Kleinhoefstraat','80', '2440', 'Geel', '070-494593', '6524');
INSERT INTO tennis.player VALUES (104, 'Mertens', 'L', '2000-05-10', 'V', 2014, 'Vosberg',  '65', '2460', 'Lichtaart', '079-987571', '7060');
INSERT INTO tennis.player VALUES (112, 'Balen, van', 'J', '1998-10-01', 'V', 2008, 'Boeretang',  '8', '2400', 'Mol', '010-548745', '1319');

INSERT INTO tennis.team VALUES (1,  6, 'first');
INSERT INTO tennis.team VALUES (2, 27, 'second');

INSERT INTO tennis.competition VALUES ( 1, 1,   6, 3, 1);
INSERT INTO tennis.competition VALUES ( 2, 1,   6, 2, 3);
INSERT INTO tennis.competition VALUES ( 3, 1,   6, 3, 0);
INSERT INTO tennis.competition VALUES ( 4, 1,  44, 3, 2);
INSERT INTO tennis.competition VALUES ( 5, 1,  83, 0, 3);
INSERT INTO tennis.competition VALUES ( 6, 1,   2, 1, 3);
INSERT INTO tennis.competition VALUES ( 7, 1,  57, 3, 0);
INSERT INTO tennis.competition VALUES ( 8, 1,   8, 0, 3);
INSERT INTO tennis.competition VALUES ( 9, 2,  27, 3, 2);
INSERT INTO tennis.competition VALUES (10, 2, 104, 3, 2);
INSERT INTO tennis.competition VALUES (11, 2, 112, 2, 3);
INSERT INTO tennis.competition VALUES (12, 2, 112, 1, 3);
INSERT INTO tennis.competition VALUES (13, 2,   8, 0, 3);

INSERT INTO tennis.fine VALUES (1,   6, '2018-12-08', 100);
INSERT INTO tennis.fine VALUES (2,  44, '2019-05-05',  75);
INSERT INTO tennis.fine VALUES (3,  27, '2017-09-10', 100);
INSERT INTO tennis.fine VALUES (4, 104, '2018-12-08',  50);
INSERT INTO tennis.fine VALUES (5,  44, '2019-12-08',  25);
INSERT INTO tennis.fine VALUES (6,   8, '2019-12-08',  25);
INSERT INTO tennis.fine VALUES (7,  44, '2016-12-30',  30);
INSERT INTO tennis.fine VALUES (8,  27, '2018-11-12',  75);

INSERT INTO tennis.board_member VALUES (  6, '2016-1-1', '2016-12-31', 'secretary');
INSERT INTO tennis.board_member VALUES (  6, '2017-1-1', '2017-12-31', 'member');
INSERT INTO tennis.board_member VALUES (  6, '2018-1-1', '2019-12-31', 'treasurer');
INSERT INTO tennis.board_member VALUES (  6, '2020-1-1', NULL, 'president');
INSERT INTO tennis.board_member VALUES (  2, '2018-1-1', '2019-12-31', 'president');
INSERT INTO tennis.board_member VALUES (  2, '2019-1-1', NULL, 'member');
INSERT INTO tennis.board_member VALUES (112, '2018-1-1', '2018-12-31', 'member');
INSERT INTO tennis.board_member VALUES (112, '2019-1-1', NULL, 'secretary');
INSERT INTO tennis.board_member VALUES (  8, '2017-1-1', '2017-12-31', 'treasurer');
INSERT INTO tennis.board_member VALUES (  8, '2018-1-1', '2018-12-31', 'secretary');
INSERT INTO tennis.board_member VALUES (  8, '2019-1-1', NULL, 'member');
INSERT INTO tennis.board_member VALUES ( 57, '2017-1-1', '2017-12-31', 'secretary');
INSERT INTO tennis.board_member VALUES ( 27, '2018-1-1', '2018-12-31', 'member');
INSERT INTO tennis.board_member VALUES ( 27, '2019-1-1', '2019-12-31', 'treasurer');
INSERT INTO tennis.board_member VALUES ( 95, '2020-1-1', NULL, 'treasurer');
