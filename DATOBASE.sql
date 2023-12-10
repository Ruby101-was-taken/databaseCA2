DROP DATABASE IF EXISTS ca2;
create database ca2;
use ca2;

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
    VendorInventoryID int NOT NULL,
    VendorID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT VendorInventory_pk PRIMARY KEY (VendorInventoryID)
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
(1, 1, 'Adam West Hall', 150),
(2, 1, 'Clint East Hall', 120),
(3, 1, 'Nolan North Hall', 190),
(4, 1, 'James South Hall', 55),
(5, 1, 'Centre Hall', 100);

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
INSERT INTO Products (ProductID, Name, Price, Description) VALUES
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
INSERT INTO VendorInventory (VendorInventoryID, VendorID, ProductID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 1, 11),
(12, 2, 12),
(13, 3, 13),
(14, 4, 14),
(15, 5, 15),
(16, 6, 16),
(17, 7, 17),
(18, 8, 18),
(19, 9, 19),
(20, 10, 20),
(21, 1, 21),
(22, 2, 22),
(23, 3, 23),
(24, 4, 24),
(25, 5, 25);
(25, 5, 25);

-- Sample data for Event table
INSERT INTO Event (VenueID, VendorID, EventID, Date) VALUES
(1, 1, 101, '2023-05-15'),
(2, 2, 102, '2023-06-20');

-- Table: DeletedProductsLog
CREATE TABLE DeletedProductsLog (
    ProductID int  NOT NULL,
    DeletedDate datetime NOT NULL,
    CONSTRAINT DeletedProductsLog_pk PRIMARY KEY (ProductID)
);


DELIMITER //

CREATE TRIGGER after_delete_product
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO DeletedProductsLog (ProductID, DeletedDate)
    VALUES (OLD.ProductID, NOW());
END;

//

DELIMITER ;

DELIMITER //
CREATE TRIGGER room_limit_highestlimit
BEFORE UPDATE ON ArtistAlley
FOR EACH ROW
BEGIN
    DECLARE checkNewCapacity INT;
    SET checkNewCapacity = NEW.Capacity;
    IF checkNewCapacity > 200 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Room cannot have more than 200 at a time';
    END IF;
END;
//
DELIMITER ;

  --INSPIRED BY https://stackoverflow.com/questions/59739854/signal-sqlstate-45000-doesnt-stop-insert, USED AS WARNING MESSAGE IF ROOM LIMIT OVER TWO HUNDED

-- Update Statement Example
UPDATE products
SET Name = 'Cute Hand-Drawn Art', Description = 'CUTE Hand drawn pictures by me in an art studio of CUTE anime characters'
WHERE ProductID = 1;
--This here where basically specifies that only the vendor with VendorID 1 will have that there new name and description

--Delete Statement Example
DELETE FROM Products
WHERE Name LIKE '*Sci-Fi*';
--This one here is mighty simple, deletes all products with "Sci-Fi" in them's names, this convention don't need em War Stars

--View Example #1
CREATE VIEW Premium_Products_Above_Average_Price AS
SELECT Name, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
--THIS USES 1 TABLE, AND SHOWS ALL PRODUCTS THAT ARE ABOVE AVERAGE PRICE, THESE ARE PREMIUM PRODUCTS

--View Example the second

--End desc


--Admin 
CREATE USER 'TheMaster'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON ca2.* TO 'TheMaster'@'localhost';

--HAHAHA! THIS IS THE POWER OF THE UNIVERSE SEED! NOW WITNESS THE BEGINNING OF A NEW UNIVERSE!

REVOKE ALL PRIVILEGES ON ca2.* TO 'TheMaster'@'localhost';

--he is no longer almighty, admin gone

-- Sauce https://www.strongdm.com/blog/mysql-create-user-manage-access-privileges-how-to#:~:text=mysql%3E%20CREATE%20USER%20'local_user',directly%20from%20any%20other%20machine.

--Users
CREATE USER 'ArtyMarty'@'localhost' IDENTIFIED BY 'abc';

GRANT SELECT ON ca2.Vendors TO 'ArtyMarty'@'localhost';
GRANT SELECT ON ca2.Products TO 'ArtyMarty'@'localhost';
GRANT SELECT ON ca2.ArtistAlley TO 'ArtyMarty'@'localhost';

-- artyMarty can only view these 3 tables, they are not allowed to Edit anything

REVOKE SELECT ON ca2.Vendors TO 'ArtyMarty'@'localhost';
REVOKE SELECT ON ca2.Products TO 'ArtyMarty'@'localhost';
REVOKE SELECT ON ca2.ArtistAlley TO 'ArtyMarty'@'localhost';

-- artyMarty can't only view these 3 tables, they can't do anything fullstop

CREATE USER 'MaintenanceMick'@'localhost' IDENTIFIED BY '123';

GRANT INSERT, UPDATE, DELETE, SELECT ON ca2.Vendors TO 'MaintenanceMick'@'localhost';
GRANT INSERT, UPDATE, DELETE, SELECT ON ca2.ArtistAlley TO 'MaintenanceMick'@'localhost';
GRANT INSERT, UPDATE, DELETE, SELECT ON ca2.Products TO 'MaintenanceMick'@'localhost';

--Mick here can edit AND view these tables

REVOKE INSERT, UPDATE, DELETE, SELECT ON ca2.Vendors FROM 'MaintenanceMick'@'localhost';
REVOKE INSERT, UPDATE, DELETE, SELECT ON ca2.ArtistAlley FROM 'MaintenanceMick'@'localhost';
REVOKE INSERT, UPDATE, DELETE, SELECT ON ca2.Products FROM 'MaintenanceMick'@'localhost';


--Procedure
DELIMITER //
CREATE PROCEDURE UpdateProductPrice(
   IN productId INT,
   IN newPrice DECIMAL(8,2)
)
BEGIN
   UPDATE Products SET Price = newPrice WHERE ProductID = productId;
END //
DELIMITER ;

CALL UpdateProductPrice(1, 50.00);

DELIMITER //
CREATE PROCEDURE InsertProduct(
   IN productName VARCHAR(255),
   IN productPrice DECIMAL(8,2),
   IN productDescription VARCHAR(255)
)
BEGIN
   INSERT INTO Products (Name, Price, Description) VALUES (productName, productPrice, productDescription);
END //
DELIMITER ;

InsertProduct('Realistic Life Sized Buffaloo', 2500,87, 'It is expensive, please don''t buy');




-- queries
-- selects the info of vendors which have a products which has a sword in the name or has scifi in the name
SELECT * from Vendors JOIN VendorInventory USING(VendorID) JOIN Products USING(ProductID) WHERE Products.name like "%Sword%" OR products.name like "%Sci-Fi%";
-- selects the name of vendors and their product if the price is bigger than 30
SELECT vendors.name, products.name, products.Price from Vendors JOIN VendorInventory USING(VendorID) JOIN Products USING(ProductID) WHERE products.Price > 30;
