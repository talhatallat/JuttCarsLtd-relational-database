

--insert fresh records for Supplier
insert into Supplier
	(SupID, SupName, SupEmail, SupPhone, SupAddress)
values
	(1,'SBT','SBT@sbt','15166410', 'Osaka'),
	(2,'BYe','BYe@BYe','6464531', 'Kanagawa'),
	(3,'JMc','JMc@JMc','343643', 'Tokyo'),
	(4,'khan','khan@khan','4643843', 'Yokohama'),
	(5,'jimi','jimi@jimi','5643734', 'Kyoto') -- ONLY ORDERED 5 CARS FROM 5 VARIOUS SUPPLIERS
go


--insert fresh records for Consignment
insert into Consignment
	(ConsignmentID, SupID, ShipmentName, PortOfLoading, PortOfDischarge, ShipVia, ShipDate)
values
	(1,1,'Malicka Highway','Osaka port', 'Dublin Port', 'RORO','1/1/26'),
	(1,2,'Derban 2','Kanagawa port', 'Dublin Port', 'RORO','1/1/26'),
	(1,3,'lokiya','tokyo port', 'Dublin Port', 'RORO','1/1/26'),
	(1,4,'jamynis rom','yokohama port', 'Dublin Port', 'RORO','1/1/26'),
	(1,5,'hulk 56','kyoto port', 'Dublin Port', 'RORO','1/1/26') -- SUPPLIED 5 CARS, EQUALS TO 5 CONSIGNMENTS AND 6TH DOES NOT EXIST.
go


--insert fresh records for Stock
insert into Stock
	(StockID, ConsignmentID, AuctionSheetNo, AuctionGrade, MileageKM, Damage)
values
	(1,1,'8515A',4.5, 85000, 'A1 U1'),
	(2,1,'8510B',4.5, 100000, 'A1 U2'),
	(3,1,'8505C',5, 20000, 'A1 A1 A1'),
	(4,1,'8502D',4, 35000, 'A1 U2 U1'),
	(5,1,'8518C',3.5, 34000, 'A1 A1 A1') -- RECEIVED 5 CONSIGNMENTS ONLY, CURRENT STOCK CONSISTS OF 5 CARS
go



--insert fresh records for Vehicle
INSERT INTO [Vehicle]
    (ChassisNo, StockID, Manufacturer, Model, Year, Month, Mileage, FuelType, Transmission, Colour, CurrentLocation, IsReady, RegNo)
VALUES
	('JH4TEST00000000001', 1, 'Toyota', 'Aqua',   2015, 6, 85000, 'Hybrid', 'Automatic', 'White',  'Dublin', 'Y', NULL),
	('JH4TEST00000000002', 2, 'Honda',  'Fit',    2017, 3, 100000, 'Petrol', 'Automatic', 'Black',  'Dublin', 'N', NULL),
	('JH4TEST00000000003', 3, 'Toyota', 'Prius',  2018, 9, 20000, 'Hybrid', 'Automatic', 'Silver', 'Japan',  'N', NULL);
GO
