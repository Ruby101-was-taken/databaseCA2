-- tables
-- Table: ArtistAlley
CREATE TABLE ArtistAlley (
    ArtistAlleyID int  NOT NULL,
    VenueID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Capacity int  NOT NULL,
    CONSTRAINT ArtistAlley_pk PRIMARY KEY (ArtistAlleyID)
);

-- Table: Event
CREATE TABLE Event (
    VenueID int  NOT NULL,
    VendorID int  NOT NULL,
    EventID int  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT Event_pk PRIMARY KEY (EventID)
);

-- Table: Products
CREATE TABLE Products (
    ProductID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Price decimal(8,2)  NOT NULL,
    Description varchar(255)  NOT NULL,
    CONSTRAINT Products_pk PRIMARY KEY (ProductID)
);

-- Table: VendorArtistAlleys
CREATE TABLE VendorArtistAlleys (
    VendorID int  NOT NULL,
    ArtistAlleyID int  NOT NULL,
    CONSTRAINT VendorArtistAlleys_pk PRIMARY KEY (VendorID)
);

-- Table: VendorInventory
CREATE TABLE VendorInventory (
    VendorID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT VendorInventory_pk PRIMARY KEY (VendorID)
);

-- Table: Vendors
CREATE TABLE Vendors (
    VendorID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    CONSTRAINT Vendors_pk PRIMARY KEY (VendorID)
);

-- Table: Venue
CREATE TABLE Venue (
    VenueID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Address varchar(255)  NOT NULL,
    CONSTRAINT Venue_pk PRIMARY KEY (VenueID)
);

-- foreign keys
-- Reference: ArtistAlley_Venue (table: ArtistAlley)
ALTER TABLE ArtistAlley ADD CONSTRAINT ArtistAlley_Venue FOREIGN KEY ArtistAlley_Venue (VenueID)
    REFERENCES Venue (VenueID);

-- Reference: Event_Vendors (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Vendors FOREIGN KEY Event_Vendors (VendorID)
    REFERENCES Vendors (VendorID);

-- Reference: Event_Venue (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Venue FOREIGN KEY Event_Venue (VenueID)
    REFERENCES Venue (VenueID);

-- Reference: VendorArtistAlleys_ArtistAlley (table: VendorArtistAlleys)
ALTER TABLE VendorArtistAlleys ADD CONSTRAINT VendorArtistAlleys_ArtistAlley FOREIGN KEY VendorArtistAlleys_ArtistAlley (ArtistAlleyID)
    REFERENCES ArtistAlley (ArtistAlleyID);

-- Reference: VendorArtistAlleys_Vendors (table: VendorArtistAlleys)
ALTER TABLE VendorArtistAlleys ADD CONSTRAINT VendorArtistAlleys_Vendors FOREIGN KEY VendorArtistAlleys_Vendors (VendorID)
    REFERENCES Vendors (VendorID);

-- Reference: VendorInventory_Products (table: VendorInventory)
ALTER TABLE VendorInventory ADD CONSTRAINT VendorInventory_Products FOREIGN KEY VendorInventory_Products (ProductID)
    REFERENCES Products (ProductID);

-- Reference: VendorInventory_Vendors (table: VendorInventory)
ALTER TABLE VendorInventory ADD CONSTRAINT VendorInventory_Vendors FOREIGN KEY VendorInventory_Vendors (VendorID)
    REFERENCES Vendors (VendorID);

-- End of file.

-- Sample data for Venue table
INSERT INTO Venue (VenueID, Name, Address) VALUES
(1, 'Convention Center', '123 Main St'),
(2, 'Art Expo Hall', '456 Elm St');

-- Sample data for ArtistAlley table
INSERT INTO ArtistAlley (ArtistAlleyID, VenueID, Name, Capacity) VALUES
(1, 1, 'Creative Corner', 50),
(2, 2, 'Artistic Express', 30);

-- Sample data for Vendors table
INSERT INTO Vendors (VendorID, Name) VALUES
(1, 'Artistic Wonders'),
(2, 'Crafty Creations');

-- Sample data for Products table
INSERT INTO Products (ProductID, Name, Price, Description) VALUES
(1, 'Painting Kit', 25.99, 'Complete set for artists'),
(2, 'Sculpture Tools', 12.50, 'High-quality sculpting tools');

-- Sample data for VendorArtistAlleys table
INSERT INTO VendorArtistAlleys (VendorID, ArtistAlleyID) VALUES
(1, 1),
(2, 2);

-- Sample data for VendorInventory table
INSERT INTO VendorInventory (VendorID, ProductID) VALUES
(1, 1),
(2, 2);

-- Sample data for Event table
INSERT INTO Event (VenueID, VendorID, EventID, Date) VALUES
(1, 1, 101, '2023-05-15'),
(2, 2, 102, '2023-06-20');
