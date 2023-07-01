CREATE FUNCTION suma(@x INT, @y INT)
RETURNS INT
AS
BEGIN
	RETURN (@x + @y)
END;

select dbo.suma(2,3);

DROP FUNCTION suma;

CREATE PROCEDURE fib (@n INT)
AS 
DECLARE @x int;
DECLARE @x1 int;
DECLARE @y int;
DECLARE @i int;
SET @x = 0;
SET @y = 1;
SET @i = 0;
BEGIN
	IF (@n < 0)  
	BEGIN
		PRINT 'Wartosc nie moze byc mniejsza od 0';	
	END;
	ELSE IF (@n = 0)
	BEGIN
		PRINT 'fib nr:0 = 0';
	END;
	ELSE IF (@n = 1) 
	BEGIN
		PRINT 'fib nr:0 = 0';
		PRINT 'fib nr:1 = 1';
	END;
	ELSE
	BEGIN
		PRINT 'fib nr:0 = 0';
		PRINT 'fib nr:1 = 1';
		WHILE ( @n - 1 > @i )
		BEGIN
			set @x1 = @y;
			set @y  = dbo.suma(@x, @y);
			set @x	= @x1;
			set @i =  @i + 1;
			PRINT 'fib nr:' + RTRIM(CAST(@i+1 as varchar)) + ' = ' + RTRIM(CAST(@y as varchar));  
		END;
	END;
END;

DROP PROCEDURE fib;

EXEC dbo.fib @n = 10;



select * FROM Person.Person;


CREATE TRIGGER upeer_name
ON Person.Person
AFTER
INSERT, UPDATE
AS
BEGIN
	update Person.Person
	set FirstName = upper(FirstName)
	Where BusinessEntityID in (select BusinessEntityID from inserted)
	PRINT 'dane zosatly zmienione'
END

DROP TRIGGER Person.upeer_name;

UPDATE Person.Person
SET FirstName = 'bob'
WHERE FirstName = 'KEN';
select * FROM Person.Person;



CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
INSTEAD OF
UPDATE
AS
BEGIN
	DECLARE @new INT;
	DECLARE @old INT;
	SET @new = (SELECT TaxRate FROM inserted);
	SET @old = (SELECT TaxRate FROM deleted);
	IF @new/@old > 1.3
	BEGIN
		PRINT 'zbyt duza podwyzka,	maksymalna podwyzka wynosi:' + RTRIM(CAST(@old*0.3 as varchar))
	END;
	ELSE
	BEGIN
		UPDATE Sales.SalesTaxRate
		SET TaxRate = (SELECT TaxRate FROM inserted)
		WHERE SalesTaxRateID in ( SELECT SalesTaxRateID FROM inserted)
	END;	
END;

DROP TRIGGER Sales.taxRateMonitoring;


UPDATE Sales.SalesTaxRate
SET TaxRate =30
WHERE SalesTaxRateID = 1;
SELECT * FROM Sales.SalesTaxRate;