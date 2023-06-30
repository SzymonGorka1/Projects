USE master;				

CREATE DATABASE Tabela_strato;
CREATE SCHEMA Tabela_strato;

CREATE TABLE Tabela_strato.GeoEon (
id_eon int PRIMARY KEY NOT NULL,
nazwa_eon varchar(50)
);

CREATE TABLE Tabela_strato.GeoEra (
id_era int PRIMARY KEY NOT NULL,
id_eon int,
nazwa_era varchar(50)
);

CREATE TABLE Tabela_strato.GeoOkres (
id_okres int PRIMARY KEY NOT NULL,
id_era int,
nazwa_okres varchar(50)
);

CREATE TABLE Tabela_strato.GeoEpoka (
id_epoka int PRIMARY KEY NOT NULL,
id_okres int,
nazwa_epoka varchar(50)
);

CREATE TABLE Tabela_strato.GeoPietro (
id_pietro int PRIMARY KEY NOT NULL,
id_epoka int,
nazwa_pietro varchar(50)
);

INSERT INTO Tabela_strato.GeoEon VALUES (1, 'Fanerozoik');

INSERT INTO Tabela_strato.GeoEra VALUES (1, 1,'Kenozoik');
INSERT INTO Tabela_strato.GeoEra VALUES (2, 1,'Mezozoik');
INSERT INTO Tabela_strato.GeoEra VALUES (3, 1,'Paleozoik');

INSERT INTO Tabela_strato.GeoOkres VALUES (1, 1,'Czwartorz¹d');
INSERT INTO Tabela_strato.GeoOkres VALUES (2, 1,'Trzeciorz¹d');
INSERT INTO Tabela_strato.GeoOkres VALUES (3, 2,'Kreda');
INSERT INTO Tabela_strato.GeoOkres VALUES (4, 2,'Jura');
INSERT INTO Tabela_strato.GeoOkres VALUES (5, 2,'Trias');
INSERT INTO Tabela_strato.GeoOkres VALUES (6, 3,'Perm');
INSERT INTO Tabela_strato.GeoOkres VALUES (7, 3,'Karbon');
INSERT INTO Tabela_strato.GeoOkres VALUES (8, 3,'Dewon');

INSERT INTO Tabela_strato.GeoEpoka VALUES (1, 1,'Halocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (2, 1,'Plejstocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (3, 2,'Pliocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (4, 2,'Miocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (5, 2,'Oligocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (6, 2,'Eocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (7, 2,'Paleocen');
INSERT INTO Tabela_strato.GeoEpoka VALUES (8, 3,'Górna');
INSERT INTO Tabela_strato.GeoEpoka VALUES (9, 3,'Dolna');
INSERT INTO Tabela_strato.GeoEpoka VALUES (10, 4,'Górna');
INSERT INTO Tabela_strato.GeoEpoka VALUES (11, 4,'Œrodkowa');
INSERT INTO Tabela_strato.GeoEpoka VALUES (12, 4,'Dolna');
INSERT INTO Tabela_strato.GeoEpoka VALUES (13, 5,'Górna');
INSERT INTO Tabela_strato.GeoEpoka VALUES (14, 5,'Œrodkowa');
INSERT INTO Tabela_strato.GeoEpoka VALUES (15, 5,'Dolna');
INSERT INTO Tabela_strato.GeoEpoka VALUES (16, 6,'Górny');
INSERT INTO Tabela_strato.GeoEpoka VALUES (17, 6,'Dolny');
INSERT INTO Tabela_strato.GeoEpoka VALUES (18, 7,'Górny');
INSERT INTO Tabela_strato.GeoEpoka VALUES (19, 7,'Dolny');
INSERT INTO Tabela_strato.GeoEpoka VALUES (20, 8,'Górny');
INSERT INTO Tabela_strato.GeoEpoka VALUES (21, 8,'Œrodkowy');
INSERT INTO Tabela_strato.GeoEpoka VALUES (22, 8,'Dolny');


INSERT INTO Tabela_strato.GeoPietro VALUES (1, 1,'');
INSERT INTO Tabela_strato.GeoPietro VALUES (2, 2,'');
INSERT INTO Tabela_strato.GeoPietro VALUES (3, 3,'Gelas');
INSERT INTO Tabela_strato.GeoPietro VALUES (4, 3,'GelasPiacent');
INSERT INTO Tabela_strato.GeoPietro VALUES (5, 3,'Zankl');
INSERT INTO Tabela_strato.GeoPietro VALUES (6, 4,'Mesyn');
INSERT INTO Tabela_strato.GeoPietro VALUES (7, 4,'Torton');
INSERT INTO Tabela_strato.GeoPietro VALUES (8, 4,'Serrawa;');
INSERT INTO Tabela_strato.GeoPietro VALUES (9, 4,'Lang');
INSERT INTO Tabela_strato.GeoPietro VALUES (10, 4,'Bordyga³');
INSERT INTO Tabela_strato.GeoPietro VALUES (11, 4,'Akwitan');
INSERT INTO Tabela_strato.GeoPietro VALUES (12, 5,'Szat');
INSERT INTO Tabela_strato.GeoPietro VALUES (13, 5,'Rupel');
INSERT INTO Tabela_strato.GeoPietro VALUES (14, 6,'Priabon');
INSERT INTO Tabela_strato.GeoPietro VALUES (15, 6,'Barton');
INSERT INTO Tabela_strato.GeoPietro VALUES (16, 6,'Lutet');
INSERT INTO Tabela_strato.GeoPietro VALUES (17, 6,'Iprez');
INSERT INTO Tabela_strato.GeoPietro VALUES (18, 7,'Tanet');
INSERT INTO Tabela_strato.GeoPietro VALUES (19, 7,'Zeland');
INSERT INTO Tabela_strato.GeoPietro VALUES (20, 7,'Dan');
INSERT INTO Tabela_strato.GeoPietro VALUES (21, 8,'Mastrycht');
INSERT INTO Tabela_strato.GeoPietro VALUES (22, 8,'Kampan');
INSERT INTO Tabela_strato.GeoPietro VALUES (23, 8,'Santon');
INSERT INTO Tabela_strato.GeoPietro VALUES (24, 8,'Koniak');
INSERT INTO Tabela_strato.GeoPietro VALUES (25, 8,'Turon');
INSERT INTO Tabela_strato.GeoPietro VALUES (26, 8,'Cenoman');
INSERT INTO Tabela_strato.GeoPietro VALUES (27, 9,'Alb');
INSERT INTO Tabela_strato.GeoPietro VALUES (28, 9,'Apt');
INSERT INTO Tabela_strato.GeoPietro VALUES (29, 9,'Barrem');
INSERT INTO Tabela_strato.GeoPietro VALUES (30, 9,'Hoteryw');
INSERT INTO Tabela_strato.GeoPietro VALUES (31, 9,'Walan¿yn');
INSERT INTO Tabela_strato.GeoPietro VALUES (32, 9,'Berias');
INSERT INTO Tabela_strato.GeoPietro VALUES (33, 10,'Tyton');
INSERT INTO Tabela_strato.GeoPietro VALUES (34, 10,'Kimeryd');
INSERT INTO Tabela_strato.GeoPietro VALUES (35, 10,'Oksford');
INSERT INTO Tabela_strato.GeoPietro VALUES (36, 11,'Kelowej');
INSERT INTO Tabela_strato.GeoPietro VALUES (37, 11,'Baton');
INSERT INTO Tabela_strato.GeoPietro VALUES (38, 11,'Bajos');
INSERT INTO Tabela_strato.GeoPietro VALUES (39, 11,'Aalen');
INSERT INTO Tabela_strato.GeoPietro VALUES (40, 12,'Toark');
INSERT INTO Tabela_strato.GeoPietro VALUES (41, 12,'Pliensbach');
INSERT INTO Tabela_strato.GeoPietro VALUES (42, 12,'Synemur');
INSERT INTO Tabela_strato.GeoPietro VALUES (43, 12,'Hetang');
INSERT INTO Tabela_strato.GeoPietro VALUES (44, 13,'Retyk');
INSERT INTO Tabela_strato.GeoPietro VALUES (45, 13,'Noryk');
INSERT INTO Tabela_strato.GeoPietro VALUES (46, 13,'Karnik');
INSERT INTO Tabela_strato.GeoPietro VALUES (47, 14,'Ladyn');
INSERT INTO Tabela_strato.GeoPietro VALUES (48, 14,'Anizyk');
INSERT INTO Tabela_strato.GeoPietro VALUES (49, 15,'Olenek');
INSERT INTO Tabela_strato.GeoPietro VALUES (50, 15,'Ind');
INSERT INTO Tabela_strato.GeoPietro VALUES (51, 16,'Tatar');
INSERT INTO Tabela_strato.GeoPietro VALUES (52, 16,'Kazañ');
INSERT INTO Tabela_strato.GeoPietro VALUES (53, 16,'Ufa');
INSERT INTO Tabela_strato.GeoPietro VALUES (54, 17,'Kungur');
INSERT INTO Tabela_strato.GeoPietro VALUES (55, 17,'Artinsk');
INSERT INTO Tabela_strato.GeoPietro VALUES (56, 17,'Sakmar');
INSERT INTO Tabela_strato.GeoPietro VALUES (57, 17,'Assel');
INSERT INTO Tabela_strato.GeoPietro VALUES (58, 18,'G¿el');
INSERT INTO Tabela_strato.GeoPietro VALUES (59, 18,'Kasimow');
INSERT INTO Tabela_strato.GeoPietro VALUES (60, 18,'Moskow');
INSERT INTO Tabela_strato.GeoPietro VALUES (61, 18,'Baszkir');
INSERT INTO Tabela_strato.GeoPietro VALUES (62, 19,'Serpuchow');
INSERT INTO Tabela_strato.GeoPietro VALUES (63, 19,'Wizen');
INSERT INTO Tabela_strato.GeoPietro VALUES (64, 19,'Turnej');
INSERT INTO Tabela_strato.GeoPietro VALUES (65, 20,'Famen');
INSERT INTO Tabela_strato.GeoPietro VALUES (66, 20,'Fran');
INSERT INTO Tabela_strato.GeoPietro VALUES (67, 21,'¯ywet');
INSERT INTO Tabela_strato.GeoPietro VALUES (68, 21,'Eifel');
INSERT INTO Tabela_strato.GeoPietro VALUES (69, 22,'Ems');
INSERT INTO Tabela_strato.GeoPietro VALUES (70, 22,'Prag');
INSERT INTO Tabela_strato.GeoPietro VALUES (71, 22,'Lochkow');




SELECT id_pietro, nazwa_pietro, GeoPietro.id_epoka, nazwa_epoka, GeoEpoka.id_okres, nazwa_okres, GeoOkres.id_era, nazwa_era, GeoEra.id_eon, nazwa_eon 
INTO Tabela_strato.TABELA 
FROM Tabela_strato.GeoPietro
INNER JOIN Tabela_strato.GeoEpoka 
ON Tabela_strato.GeoEpoka.id_epoka  = Tabela_strato.GeoPietro.id_epoka
INNER JOIN Tabela_strato.GeoOkres
ON Tabela_strato.GeoOkres.id_okres = Tabela_strato.GeoEpoka.id_okres
INNER JOIN Tabela_strato.GeoEra
ON Tabela_strato.GeoEra.id_era = Tabela_strato.GeoOkres.id_era
INNER JOIN Tabela_strato.GeoEon 
ON Tabela_strato.GeoEon.id_eon = Tabela_strato.GeoEra.id_eon

ALTER TABLE Tabela_strato.TABELA
ADD PRIMARY KEY (id_pietro);




CREATE TABLE Dziesiec(
cyfra int,
bit int);

INSERT INTO Dziesiec VALUES (0, 0);
INSERT INTO Dziesiec VALUES (1, 1);
INSERT INTO Dziesiec VALUES (2, 2);
INSERT INTO Dziesiec VALUES (3, 3);
INSERT INTO Dziesiec VALUES (4, 4);
INSERT INTO Dziesiec VALUES (5, 5);
INSERT INTO Dziesiec VALUES (6, 6);
INSERT INTO Dziesiec VALUES (7, 7);
INSERT INTO Dziesiec VALUES (8, 8);
INSERT INTO Dziesiec VALUES (9, 9);




CREATE TABLE Milion(
liczba int,
cyfra int,
bit int);

INSERT INTO Milion 
SELECT 
a1.cyfra + 10 * a2.cyfra + 100 * a3.cyfra + 1000 * a4.cyfra + 10000 * a5.cyfra + 10000 * a6.cyfra AS liczba, 
a1.cyfra AS cyfra, 
a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6 ;


--1zap-------------------------------------------------------------------------------------------------

SELECT COUNT(*) 
FROM Milion 
INNER JOIN Tabela_strato.TABELA 
ON (Milion.liczba%68)=(TABELA.id_pietro);

CREATE INDEX index1 ON Tabela_strato.TABELA  (id_pietro);
CREATE CLUSTERED INDEX index2 ON Milion  (liczba);
CREATE INDEX index2 ON Tabela_strato.GeoPietro  (id_pietro);
CREATE INDEX index3 ON Tabela_strato.GeoOkres  (id_okres);
CREATE INDEX index4 ON Tabela_strato.GeoEra  (id_era);
CREATE INDEX index5 ON Tabela_strato.GeoEon  (id_eon);
DROP INDEX index1 ON Tabela_strato.TABELA;
DROP INDEX index2 ON Milion ;
DROP INDEX index2 ON Tabela_strato.GeoPietro  ;
DROP INDEX index3 ON Tabela_strato.GeoOkres  ;
DROP INDEX index4 ON Tabela_strato.GeoEra  ;
DROP INDEX index5 ON Tabela_strato.GeoEon  ;
--2zap-------------------------------------------------------------------------------------------------

SELECT COUNT(*) 
FROM Milion 
JOIN Tabela_strato.GeoPietro 
ON (Milion.liczba%68)=GeoPietro.id_pietro 
JOIN Tabela_strato.GeoEpoka 
ON GeoEpoka.id_epoka = GeoPietro.id_epoka 
JOIN Tabela_strato.GeoOkres 
ON GeoEpoka.id_okres = GeoOkres.id_okres
JOIN Tabela_strato.GeoEra 
ON GeoOkres.id_era = GeoEra.id_era
JOIN Tabela_strato.GeoEon
ON GeoEra.id_eon = GeoEon.id_eon;

--3zap-------------------------------------------------------------------------------------------------

SELECT COUNT(*) 
FROM Milion 
WHERE (Milion.liczba%68) = (SELECT id_pietro 
							FROM Tabela_strato.TABELA 
							WHERE (Milion.liczba%68)=(id_pietro));

--4zap-------------------------------------------------------------------------------------------------

SELECT COUNT(*) 
FROM Milion 
WHERE (Milion.liczba%68) IN (SELECT GeoPietro.id_pietro 
						   FROM Tabela_strato.GeoPietro 
						   JOIN Tabela_strato.GeoEpoka 
						   ON GeoPietro.id_epoka = GeoEpoka.id_epoka
						   JOIN Tabela_strato.GeoOkres
						   ON GeoEpoka.id_okres = GeoOkres.id_okres
						   JOIN Tabela_strato.GeoEra
						   ON GeoOkres.id_era = GeoEra.id_era
						   JOIN Tabela_strato.GeoEon
						   ON GeoEra.id_eon = GeoEon.id_eon);