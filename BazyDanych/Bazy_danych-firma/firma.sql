CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy (
    id_pracownika int PRIMARY KEY NOT NULL,
    imie varchar(50) NOT NULL,
    nazwisko varchar(50),
    adres varchar(255),
	telefon int);

CREATE TABLE rozliczenia.godziny (
    id_godziny int PRIMARY KEY NOT NULL,
    data date,
	liczba_godzin int,
	id_pracownika int,
	CONSTRAINT fkID FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika));

CREATE TABLE rozliczenia.premie (
    id_premii int PRIMARY KEY NOT NULL,
    rodzaj varchar(50),
	kwota float);


CREATE TABLE rozliczenia.pensje (
    id_pensji int PRIMARY KEY NOT NULL,
    stanowisko varchar(50) NOT NULL,
	kwota float,
	id_premii int,
	CONSTRAINT fkID FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie (id_premii));
	
	INSERT INTO rozliczenia.pracownicy VALUES(1,'Adam','Adamiec','Podwale 7, 31-118 Kraków',862625809);
	INSERT INTO rozliczenia.pracownicy VALUES(2,'Ewa','Adamik','Studencka 1, 31-116 Kraków',457589365);
	INSERT INTO rozliczenia.pracownicy VALUES(3,'Antoni','Adamiuk','Krupnicza 10, 31-123 Kraków',313231128);
	INSERT INTO rozliczenia.pracownicy VALUES(4,'Zbigniew','Adamkeiwicz','Studencka 7, 31-116 Kraków',069322912);
	INSERT INTO rozliczenia.pracownicy VALUES(5,'Ryszard','Adamkowski','Krupnicza 14, 31-123 Kraków',773422468);
	INSERT INTO rozliczenia.pracownicy VALUES(6,'Szymon','Adamowicz','Krupnicza 18, 31-123 Kraków',021344556);
	INSERT INTO rozliczenia.pracownicy VALUES(7,'Kunegunda','Adamów','Garncarska 3, 31-115 Kraków',970813104);
	INSERT INTO rozliczenia.pracownicy VALUES(8,'Eugenia','Adamek','Studencka 25/18, 31-116 Kraków',811264400);
	INSERT INTO rozliczenia.pracownicy VALUES(9,'Anna','Adamik','Napoleona Cybulskiego 8, 31-117 Kraków',111656015);
	INSERT INTO rozliczenia.pracownicy VALUES(10,'Sylwia','Adamkowska','Krupnicza 35, 31-123 Kraków',015150615);
	
	INSERT INTO rozliczenia.godziny VALUES(1,'2021-10-23',8,1);
	INSERT INTO rozliczenia.godziny VALUES(2,'2021-10-23',8,2);
	INSERT INTO rozliczenia.godziny VALUES(3,'2021-10-23',6,3);
	INSERT INTO rozliczenia.godziny VALUES(4,'2021-10-24',7,4);
	INSERT INTO rozliczenia.godziny VALUES(5,'2021-10-24',8,1);
	INSERT INTO rozliczenia.godziny VALUES(6,'2021-10-24',4,2);
	INSERT INTO rozliczenia.godziny VALUES(7,'2021-10-25',8,7);
	INSERT INTO rozliczenia.godziny VALUES(8,'2021-10-26',3,9);
	INSERT INTO rozliczenia.godziny VALUES(9,'2021-10-26',7,10);
	INSERT INTO rozliczenia.godziny VALUES(10,'2021-10-27',3,1);
	
	INSERT INTO rozliczenia.premie VALUES(1,'Premia regulaminowa',100);
	INSERT INTO rozliczenia.premie VALUES(2,'Premia uznaniowa',150);
	INSERT INTO rozliczenia.premie VALUES(3,'Premię motywacyjna',50);
	INSERT INTO rozliczenia.premie VALUES(4,'Premię zadaniowa',500);
	INSERT INTO rozliczenia.premie VALUES(5,'Premia prowizyjna',75);
	INSERT INTO rozliczenia.premie VALUES(6,'Premia indywidualna lub zespołowa',360);
	INSERT INTO rozliczenia.premie VALUES(7,'Premia wynikowa',1000);
	INSERT INTO rozliczenia.premie VALUES(8,'Premia uznaniowa',300);
	INSERT INTO rozliczenia.premie VALUES(9,'Premia uznaniowa',500);
	INSERT INTO rozliczenia.premie VALUES(10,'Premię motywacyjna',200);
	
	INSERT INTO rozliczenia.pensje VALUES(1,'Project Manager',20000,7);
	INSERT INTO rozliczenia.pensje VALUES(2,'Analityk biznesowy',15000,3);
	INSERT INTO rozliczenia.pensje VALUES(3,'UI/UX Designer',15000,6);
	INSERT INTO rozliczenia.pensje VALUES(4,'Role techniczne',10000,6);
	INSERT INTO rozliczenia.pensje VALUES(5,'Architekt systemu',15000,2);
	INSERT INTO rozliczenia.pensje VALUES(6,'Programiści',9000,1);
	INSERT INTO rozliczenia.pensje VALUES(7,'Testerzy',8000,1);
	INSERT INTO rozliczenia.pensje VALUES(8,'Software Developer',10000,7);
	INSERT INTO rozliczenia.pensje VALUES(9,'Web Developer',10000,10);
	INSERT INTO rozliczenia.pensje VALUES(10,'Back-end Developer',10000,5);
	
	
	ALTER TABLE rozliczenia.pracownicy ADD drugie_imie varchar(40) 



	SELECT nazwisko, adres
	FROM rozliczenia.pracownicy
	
	
	SELECT 
	godziny.data,
	date_part('week', godziny.data) AS week,
	date_part('month', godziny.data) AS month
	FROM rozliczenia.godziny
	
	SELECT * FROM rozliczenia.pensje
	
	ALTER TABLE rozliczenia.pensje RENAME kwota TO kwota_brutto;
	ALTER TABLE rozliczenia.pensje ADD kwota_netto int
	INSERT INTO rozliczenia.pensje (kwota_netto)
	SELECT kwota_brutto
	FROM rozliczenia.pensje;
	UPDATE Rozliczenia.pensje SET kwota_netto = kwota_brutto*1.19