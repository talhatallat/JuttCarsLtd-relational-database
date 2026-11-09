
select * from Vehicle
select * from Stock
select * from Consignment
select * from Supplier


/*
INSERT INTO Vehicle
    (ChassisNo, StockID, Manufacturer)
VALUES
    ('JH4TEST00000000004', 5, 'Toyota');
	*/


/*
-- to delete all records from Stock
DELETE FROM Stock
GO
*/




/*
INSERT INTO Supplier
	(SupName, SupEmail, SupPhone, SupAddress)
VALUES
	('SBT Co. Ltd', NULL, NULL, 'Japan');
GO*/


/*
UPDATE Stock
SET SupID = 200
WHERE StockID IN (1, 2, 3, 4, 5);
GO
*/


/*
DELETE FROM Vehicle
GO
*/



/* -- Restore normal database access (multi)
USE master;
GO

ALTER DATABASE [JuttCarsLtd]
SET MULTI_USER;
GO
*/


/* -- to find the sessionID
USE master;
GO

SELECT
    spid AS SessionID,
    loginame AS LoginName,
    hostname AS HostName,
    program_name AS Application,
    status AS SessionStatus
FROM master..sysprocesses
WHERE dbid = DB_ID('JuttCarsLtd')
  AND spid <> @@SPID;
GO
*/


/* -- to kill the session
KILL 58;
GO
*/


/*
-- to delete JuttCarsLtd database
USE master;
GO

ALTER DATABASE [JuttCarsLtd]
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE [JuttCarsLtd];
GO
*/


/*
ALTER TABLE Stock
ALTER COLUMN AuctionGrade DECIMAL(3,1);
GO
*/




-- to Delete specific records in Stock
/*
DELETE FROM Stock
WHERE StockID IN ('5','WVWZZZAUZFD542985','8515',4,85000,'A1 U1');
GO
*/


/*
-- Delete existing database
USE master;
GO

IF DB_ID('JuttCarsLtd') IS NOT NULL
BEGIN
    ALTER DATABASE JuttCarsLtd
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE JuttCarsLtd;
END;
GO
*/