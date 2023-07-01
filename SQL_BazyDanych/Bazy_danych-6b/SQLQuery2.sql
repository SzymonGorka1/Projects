CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika int PRIMARY KEY NOT NULL,
    imie varchar(50) NOT NULL,
    nazwisko varchar(50),
    adres varchar(255),
	telefon int);

CREATE TABLE ksiegowosc.godziny (
    id_godziny int PRIMARY KEY NOT NULL,
    data date,
	liczba_godzin int,
	id_pracownika int,
	CONSTRAINT fkID FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika));

CREATE TABLE ksiegowosc.premie (
    id_premii int PRIMARY KEY NOT NULL,
    rodzaj varchar(50),
	kwota float);


CREATE TABLE ksiegowosc.pensje (
    id_pensji int PRIMARY KEY NOT NULL,
    stanowisko varchar(50) NOT NULL,
	kwota float,
	id_premii int,
	CONSTRAINT prID FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie (id_premii));


CREATE TABLE ksiegowosc.wynagrodzenie (
    id_wynagrodzenia int PRIMARY KEY NOT NULL,
    data date NOT NULL,
	id_pracownika int,
	CONSTRAINT praID FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika),
	id_godziny int,
	CONSTRAINT godID FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny (id_godziny),
	id_pensji int,
	CONSTRAINT penID FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje (id_pensji),
	id_premii int,
	CONSTRAINT preID FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie (id_premii));


	/*
	COMMENT ON TABLE ksiegowosc.pracownicy IS 'tabela pracownikow'
	COMMENT ON TABLE ksiegowosc.godziny IS 'tabela godzin'
	COMMENT ON TABLE ksiegowosc.premie IS 'tabela premii'
	COMMENT ON TABLE ksiegowosc.pensje IS 'tabela pensji'
	COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'tabela wynagrodzen'
	-- Je¿eli uda³o mi siê znaleŸæ rzetelne informacjê to powy¿sze polecenia powinny dzialac w Postgres, niestety w sql server nie ma komendy odpoiwdajacej powyzszej.
	*/


	
	INSERT INTO ksiegowosc.pracownicy VALUES(1,'Adam','Adamiec','Podwale 7, 31-118 Kraków',862625809);
	INSERT INTO ksiegowosc.pracownicy VALUES(2,'Ewa','Adamik','Studencka 1, 31-116 Kraków',457589365);
	INSERT INTO ksiegowosc.pracownicy VALUES(3,'Antoni','Adamiuk','Krupnicza 10, 31-123 Kraków',313231128);
	INSERT INTO ksiegowosc.pracownicy VALUES(4,'Zbigniew','Adamkeiwicz','Studencka 7, 31-116 Kraków',069322912);
	INSERT INTO ksiegowosc.pracownicy VALUES(5,'Ryszard','Adamkowski','Krupnicza 14, 31-123 Kraków',773422468);
	INSERT INTO ksiegowosc.pracownicy VALUES(6,'Szymon','Adamowicz','Krupnicza 18, 31-123 Kraków',021344556);
	INSERT INTO ksiegowosc.pracownicy VALUES(7,'Kunegunda','Adamów','Garncarska 3, 31-115 Kraków',970813104);
	INSERT INTO ksiegowosc.pracownicy VALUES(8,'Eugenia','Adamek','Studencka 25/18, 31-116 Kraków',811264400);
	INSERT INTO ksiegowosc.pracownicy VALUES(9,'Anna','Adamik','Napoleona Cybulskiego 8, 31-117 Kraków',111656015);
	INSERT INTO ksiegowosc.pracownicy VALUES(10,'Sylwia','Adamkowska','Krupnicza 35, 31-123 Kraków',015150615);
	
	INSERT INTO ksiegowosc.godziny VALUES(1,'2021-10-23',8,1);
	INSERT INTO ksiegowosc.godziny VALUES(2,'2021-10-23',8,2);
	INSERT INTO ksiegowosc.godziny VALUES(3,'2021-10-23',6,3);
	INSERT INTO ksiegowosc.godziny VALUES(4,'2021-10-24',7,4);
	INSERT INTO ksiegowosc.godziny VALUES(5,'2021-10-24',8,1);
	INSERT INTO ksiegowosc.godziny VALUES(6,'2021-10-24',4,2);
	INSERT INTO ksiegowosc.godziny VALUES(7,'2021-10-25',8,7);
	INSERT INTO ksiegowosc.godziny VALUES(8,'2021-10-26',3,9);
	INSERT INTO ksiegowosc.godziny VALUES(9,'2021-10-26',7,10);
	INSERT INTO ksiegowosc.godziny VALUES(10,'2021-10-27',3,1);
	
	INSERT INTO ksiegowosc.premie VALUES(1,'Premia regulaminowa',100);
	INSERT INTO ksiegowosc.premie VALUES(2,'Premia uznaniowa',150);
	INSERT INTO ksiegowosc.premie VALUES(3,'Premiê motywacyjna',50);
	INSERT INTO ksiegowosc.premie VALUES(4,'Premiê zadaniowa',500);
	INSERT INTO ksiegowosc.premie VALUES(5,'Premia prowizyjna',75);
	INSERT INTO ksiegowosc.premie VALUES(6,'Premia indywidualna lub zespo³owa',360);
	INSERT INTO ksiegowosc.premie VALUES(7,'Premia wynikowa',1000);
	INSERT INTO ksiegowosc.premie VALUES(8,'Premia uznaniowa',300);
	INSERT INTO ksiegowosc.premie VALUES(9,'Premia uznaniowa',500);
	INSERT INTO ksiegowosc.premie VALUES(10,'Premiê motywacyjna',200);
	
	INSERT INTO ksiegowosc.pensje VALUES(1,'Project Manager',20000,7);
	INSERT INTO ksiegowosc.pensje VALUES(2,'Analityk biznesowy',15000,3);
	INSERT INTO ksiegowosc.pensje VALUES(3,'UI/UX Designer',15000,6);
	INSERT INTO ksiegowosc.pensje VALUES(4,'Role techniczne',10000,6);
	INSERT INTO ksiegowosc.pensje VALUES(5,'Architekt systemu',15000,2);
	INSERT INTO ksiegowosc.pensje VALUES(6,'Programiœci',9000,1);
	INSERT INTO ksiegowosc.pensje VALUES(7,'Testerzy',8000,1);
	INSERT INTO ksiegowosc.pensje VALUES(8,'Software Developer',10000,7);
	INSERT INTO ksiegowosc.pensje VALUES(9,'Web Developer',10000,10);
	INSERT INTO ksiegowosc.pensje VALUES(10,'Back-end Developer',10000,5);

	INSERT INTO ksiegowosc.wynagrodzenie VALUES(1,'2021-10-27',1,1,1,5);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(2,'2021-10-27',2,1,3,8);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(3,'2021-10-27',3,2,8,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(4,'2021-10-28',4,6,2,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(5,'2021-10-28',5,7,8,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(6,'2021-10-28',6,3,1,1);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(7,'2021-10-29',7,9,9,10);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(8,'2021-10-29',2,10,5,6);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(9,'2021-10-29',5,5,1,4);
	INSERT INTO ksiegowosc.wynagrodzenie VALUES(10,'2021-10-30',8,8,10,9);

--a)
ALTER TABLE ksiegowosc.pracownicy 
ADD nr_tel varchar(255);

UPDATE ksiegowosc.pracownicy 
SET pracownicy.nr_tel = '(+48)' + CAST(telefon as varchar);

ALTER TABLE ksiegowosc.pracownicy 
DROP COLUMN telefon;

--b)
UPDATE ksiegowosc.pracownicy 
SET pracownicy.nr_tel = SUBSTRING(pracownicy.nr_tel,1,8) + '-' + 
						SUBSTRING(pracownicy.nr_tel,9,11) + '-' + 
						SUBSTRING(pracownicy.nr_tel,12,14);

--c)

SELECT UPPER(nazwisko), UPPER(imie), UPPER(adres), UPPER(nr_tel)
FROM ksiegowosc.pracownicy
WHERE len(nazwisko) = (select max(len(nazwisko)) from ksiegowosc.pracownicy);
select * from ksiegowosc.pracownicy;
--d)

SELECT	CONVERT(VARCHAR(64), HashBytes('MD5', pracownicy.nazwisko), 2) as MD5Hash,
		CONVERT(VARCHAR(64), HashBytes('MD5', pracownicy.imie), 2) as MD5Hash,
		CONVERT(VARCHAR(64), HashBytes('MD5', pracownicy.adres), 2) as MD5Hash,
		CONVERT(VARCHAR(64), HashBytes('MD5', CAST(pensje.kwota AS varchar)), 2) as MD5Hash
	FROM ksiegowosc.pracownicy
	JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji;

--f)

SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota, premie.kwota 
	FROM ksiegowosc.pracownicy
	LEFT OUTER JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	LEFT OUTER JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	LEFT OUTER JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii


--g)
SELECT 'Pracownik ' + pracownicy.imie + ' ' + pracownicy.nazwisko + ', w dniu ' + CAST(godziny.data as varchar) + ' otrzymal pensje calkowita ' +
		CAST(premie.kwota + pensje.kwota as varchar) + ' zl, gdzie wynagrodzenie zasadnicze wynosilo: ' + CAST(pensje.kwota as varchar) + 
		' zl, premia: ' + CAST(premie.kwota as varchar) + 'zl, nadgodziny: ' + CAST(godziny.liczba_godzin as varchar) + ' godzin.'
	FROM ksiegowosc.pracownicy
	LEFT OUTER JOIN ksiegowosc.wynagrodzenie 
	ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
	LEFT OUTER JOIN ksiegowosc.pensje 
	ON wynagrodzenie.id_pensji = pensje.id_pensji
	LEFT OUTER JOIN ksiegowosc.premie
	ON wynagrodzenie.id_premii = premie.id_premii
	LEFT OUTER JOIN ksiegowosc.godziny
	ON wynagrodzenie.id_godziny = godziny.id_godziny
