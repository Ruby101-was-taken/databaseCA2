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
    Email varchar(255) NOT NULL,
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
VALUES (1, 1, 'Adam West Hall', 150),
VALUES (2, 1, 'Clint East Hall', 120),
VALUES (3, 1, 'Nolan North Hall', 190),
VALUES (4, 1, 'James South Hall', 55),
VALUES (5, 1, 'Centre Hall', 100);

-- Sample data for Vendors table
INSERT INTO Vendors (VendorID, Name, Email) VALUES
(1, 'Artistic Wonders', 'ArtWon@gmail.com'),
(2, 'Crafty Creations', 'CrafCrea@hotmail.com'),
(3, 'Tech Innovations', 'TechInno@yahoo.com'),
(4, 'Cosplay Seamstress', 'CosSeam@outlook.com'),
(5, 'Jays'' Bodega', 'JayBoda@hotmail.com'),
(6, 'Nerd Tops', 'Nerto@gmail.com'),
(7, 'Sci-Fi High Fashion', 'Scifihifa@gmail.com'),
(8, 'Jabba The Hutt Fashion Hut', 'Jabbathehufahu@yahoo.com'),
(9, 'Samurai Smithed Swords', 'Sasmsw@gmail.com'),
(10, 'Bejeweled and To-Bejeweled', 'Beantobe@gmail.com');


-- Sample data for Products table
INSERT INTO Products (ProductID, Name, Price, Description)
  (1, 'Hand-Drawn Art', 10.00, 'Hand drawn pictures by me in an art studio of anime characters'),
  (2, 'Digital Art Drawings', 25.00, 'Digital designed art of various genres and shows'),
  (3, 'Wooden Prop Swords', 50.00, 'Handmade and painted wooden swords based on swords from various TV shows'),
  (4, 'Virtual Reality Experience', 30.00, 'VR simulations for all ages'),
  (5, 'Comic Book Collectibles', 15.00, 'Rare and vintage comic books'),
  (6, 'Custom Cosplay Costumes', 80.00, 'Cosplay outfits for various characters characters'),
  (7, 'Handcrafted Jewelry', 40.00, 'Handmade jewelry pieces'),
  (8, 'Anime Merchandise', 20.00, 'Official merchandise from anime series'),
  (9, 'Board Games Galore', 35.00, 'Board games for all ages'),
  (10, 'Sci-Fi Memorabilia', 45.00, 'Collectibles from science fiction movies'),
  (11, 'Geeky Gadgets', 60.00, 'Tech gadgets with a geeky and futuristic style'),
  (12, 'Fantasy Art Prints', 18.00, 'High quality prints of fantasy artwork for your walls'),
  (13, 'Magic Potions', 12.00, 'Novelty drinks with magical effects'),
  (14, 'Video Game Merch', 22.00, 'Merchandise from popular video games'),
  (15, 'DIY Craft Kits', 25.00, 'Craft kits for creating your own decorations'),
  (16, 'Superhero Capes', 15.00, 'Customizable capes for kids and adults'),
  (17, 'Handmade Plushies', 30.00, 'Adorable handmade plush toys inspired by various shows'),
  (18, 'Fandom T-Shirts', 18.00, 'High-quality T-shirts featuring designs from various shows'),
  (19, 'Collectible Figurines', 40.00, 'Limited edition Funkos of characters from movies and TV shows'),
  (20, 'Pop Culture Posters', 15.00, 'Posters showcasing your favorite movies'),
  (21, 'Gaming Accessories', 25.00, 'Accessories for gamers, including mouse pads and headsets'),
  (22, 'Sci-Fi Books Collection', 12.00, 'A collection of science fiction novels'),
  (23, 'Fantasy-themed Candles', 20.00, 'Handmade candles with scents inspired by fantasy settings'),
  (24, 'Manga Artwork Prints', 14.00, 'Art prints featuring illustrations from popular mangas'),
  (25, 'Convention Exclusive Merch', 30.00, 'Merchandise available exclusively at the convention');

-- Sample data for VendorArtistAlleys table
INSERT INTO VendorArtistAlleys (VendorID, ArtistAlleyID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- Sample data for VendorInventory table
INSERT INTO VendorInventory (VendorID, ProductID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(6, 16),
(7, 17),
(8, 18),
(9, 19),
(10, 20),
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25);

-- Sample data for Event table
INSERT INTO Event (VenueID, VendorID, EventID, Date) VALUES
(1, 1, 101, '2023-05-15'),
(2, 2, 102, '2023-06-20');

CREATE TABLE DeletedProductsLog(
    ProductID int  NOT NULL,
    CONSTRAINT Venue_pk PRIMARY KEY (ProductID)
);

DELIMITER //
;
CREATE TRIGGER after_delete_product
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    -- Your trigger logic goes here
    -- For example, you can log the deletion into a separate table
    INSERT INTO DeletedProductsLog (ProductID, DeletedDate)
    VALUES (OLD.ProductID, NOW());
END;
DELIMITER ;
//

DELIMITER //
;
CREATE TRIGGER room_limit_highestlimit
BEFORE UPDATE ON ArtistAlley
FOR EACH ROW
BEGIN
 DECLARE checkNewCapacity;
SET checkNewCapacity = NEW.Capacity;
IF checkNewCapacity > 200 THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Room cannot have more than 200 at a time'
  END IF;
  END;
  DELIMITER :
  //
  --INSPIRED BY https://stackoverflow.com/questions/59739854/signal-sqlstate-45000-doesnt-stop-insert, USED AS WARNING MESSAGE IF ROOM LIMIT OVER TWO HUNDED

-- Update Statement Example
UPDATE Vendors
SET Name = 'Cute Hand-Drawn Art', Description = 'CUTE Hand drawn pictures by me in an art studio of CUTE anime characters'
WHERE VendorID = 1;
--This here where basically specifies that only the vendor with VendorID 1 will have that there new name and description

--Delete Statement Example
DELETE FROM Products
WHERE Name LIKE '*Sci-Fi*';
--This one here is mighty simple, deletes all products with "Sci-Fi" in them's names, this convention don't need em War Stars

--View Example #1
CREATE VIEW [Premium Products Above Average Price ]
SELECT Name, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
--THIS USES 1 TABLE, AND SHOWS ALL PRODUCTS THAT ARE ABOVE AVERAGE PRICE, THESE ARE PREMIUM PRODUCTS

--View Example the second

--End desc

