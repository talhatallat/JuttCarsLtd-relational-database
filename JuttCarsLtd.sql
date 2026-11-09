
-- =============================================
-- JUTT CARS LTD DATABASE
-- Microsoft SQL Server
-- Stage 1: Create database and tables
-- Primary Keys included
-- Foreign Keys will be added later
-- =============================================

IF DB_ID('JuttCarsLtd') IS NULL
BEGIN
    CREATE DATABASE JuttCarsLtd;
END;
GO

USE JuttCarsLtd;
GO

-- 1. SUPPLIER ✔️
CREATE TABLE [Supplier] (
    [SupID] INT,
    [SupName] VARCHAR(50),
    [SupEmail] VARCHAR(100),
    [SupPhone] VARCHAR(100),
    [SupAddress] VARCHAR(250),

    CONSTRAINT [PK_Supplier]
        PRIMARY KEY ([SupID]) 
);


-- 2. CONSIGNMENT ✔️
CREATE TABLE [Consignment] (
    [ConsignmentID] INT,
    [SupID] INT NOT NULL,
    [ShipmentName] VARCHAR(100),
    [PortOfLoading] VARCHAR(50),
    [PortOfDischarge] VARCHAR(50),
    [ShipVia] VARCHAR(15),
    [ShipDate] DATETIME2,

    CONSTRAINT [PK_Consignment]
        PRIMARY KEY ([ConsignmentID]),

    CONSTRAINT FK_Consignment_Supplier
        FOREIGN KEY (SupID)
        REFERENCES Supplier(SupID) 
);


-- 3. STOCK ✔️
CREATE TABLE [Stock] (
    [StockID] INT,
    [ConsignmentID] INT NOT NULL UNIQUE,
    [AuctionSheetNo] VARCHAR(15),
    [AuctionGrade] DECIMAL(3,1),
    [MileageKM] INT,
    [Damage] VARCHAR(200),

    CONSTRAINT [PK_Stock]
        PRIMARY KEY ([StockID]),
    
    CONSTRAINT [FK_Stock_Consignment]
        FOREIGN KEY ([ConsignmentID])
        REFERENCES [Consignment]([ConsignmentID]) 
);


-- 4. VEHICLE
CREATE TABLE [Vehicle] (
    [ChassisNo] VARCHAR(25),
    [StockID] INT NOT NULL,
    [Manufacturer] VARCHAR(50),
    [Model] VARCHAR(30),
    [Year] INT,
    [Month] INT,
    [Mileage] INT,
    [FuelType] VARCHAR(10),
    [Transmission] VARCHAR(10),
    [Colour] VARCHAR(20),
    [CustID] INT,
    [CurrentLocation] VARCHAR(50),
    [IsReady] CHAR(1),
    [RegNo] VARCHAR(15),

    PRIMARY KEY ([ChassisNo]),

    CONSTRAINT [FK_Vehicle_StockID]
        FOREIGN KEY ([StockID])
        REFERENCES [Stock]([StockID]),
    
    CONSTRAINT [UQ_Vehicle_StockID]
        UNIQUE ([StockID]) 
);


-- 3. AIS AGENT
CREATE TABLE [AISAgent] (
    AgentID INT IDENTITY(1,1) PRIMARY KEY,
    AgentVatNo CHAR(15),
    AgentName VARCHAR(50),
    AgentEmail VARCHAR(100),
    EntryNumber VARCHAR(50),
    EntryDate DATETIME2,
    CustomClearanceStatus VARCHAR(MAX),
    ClearanceTime VARCHAR(100)
);
GO

-- 4. TRANSPORT CONTRACTOR
CREATE TABLE [TransportContractor] (
    TranComName VARCHAR(100) PRIMARY KEY,
    VatNo VARCHAR(15),
    EmpName VARCHAR(100),
    DateHired DATETIME2,
    Port VARCHAR(50),
    Destination VARCHAR(50)
);
GO

-- 5. SHIPMENT OFFLOAD RORO
CREATE TABLE [ShipmentOffloadRORO] (
    CompanyName VARCHAR(50) PRIMARY KEY,
    VatNo CHAR(15),
    VesselName VARCHAR(50),
    ShipmentReleaseStatus VARCHAR(MAX),
    DateOfArrival DATETIME2,
    ChassisNo VARCHAR(25),
    TotalNoOfPackage INT,
    PortParkingLocation VARCHAR(20),
    AgentID INT,
    TranComName VARCHAR(100)
);
GO

-- 6. CUSTOMER
CREATE TABLE [Customer] (
    CustID INT IDENTITY(1,1) PRIMARY KEY,
    CustFullName VARCHAR(100),
    CustAdd VARCHAR(MAX),
    CustPhoneNo VARCHAR(20),
    CustEmail VARCHAR(150),
    DateSold DATETIME2,
    LogBookNo VARCHAR(10)
);
GO

-- 7. VRT CONTRACTOR
CREATE TABLE [VRTContractor] (
    ContractorID INT IDENTITY(1,1) PRIMARY KEY,
    ContractorComp VARCHAR(30),
    VatNo VARCHAR(15),
    EmpName VARCHAR(100),
    DateHired DATETIME2
);
GO

-- 8. REGISTRATION
CREATE TABLE [Registration] (
    RegNo VARCHAR(15) PRIMARY KEY,
    RegBookingDate DATETIME2,
    VRTAddress VARCHAR(150),
    NOx INT,
    CO2 INT,
    ContractorID INT
);
GO



-- 11. NCT
CREATE TABLE [NCT] (
    NCTBookingID INT IDENTITY(1,1) PRIMARY KEY,
    RegNo VARCHAR(15),
    DateOfBooking DATETIME2,
    [Address] VARCHAR(250),
    RepairID INT
);
GO

-- 12. REPAIR
CREATE TABLE [Repair] (
    RepairID INT IDENTITY(1,1) PRIMARY KEY,
    GarageName VARCHAR(50),
    TypeOfRepair VARCHAR(100)
);
GO

-- 13. GARAGE
CREATE TABLE [Garage] (
    GarageName VARCHAR(50) PRIMARY KEY,
    GarageAddress VARCHAR(250),
    MechanicName VARCHAR(100)
);
GO

-- =============================================
-- CHECK CREATED TABLES
-- =============================================

-- SELECT TABLE_NAME
-- FROM INFORMATION_SCHEMA.TABLES
-- WHERE TABLE_TYPE = 'BASE TABLE'
-- ORDER BY TABLE_NAME;
-- GO
-- </CodeBlock>