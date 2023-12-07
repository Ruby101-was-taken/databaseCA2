
CREATE TABLE ArtistAlley (
    ArtistAlleyID int  NOT NULL,
    VenueID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Capacity int  NOT NULL,
    CONSTRAINT ArtistAlley_pk PRIMARY KEY (ArtistAlleyID)
);

CREATE TABLE Event (
    VenueID int  NOT NULL,
    VendorID int  NOT NULL,
    EventID int  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT Event_pk PRIMARY KEY (EventID)
);

CREATE TABLE Products (
    ProductID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Price decimal(8,2)  NOT NULL,
    Description varchar(255)  NOT NULL,
    CONSTRAINT Products_pk PRIMARY KEY (ProductID)
);

CREATE TABLE VendorArtistAlleys (
    VendorID int  NOT NULL,
    ArtistAlleyID int  NOT NULL,
    CONSTRAINT VendorArtistAlleys_pk PRIMARY KEY (VendorID)
);

CREATE TABLE VendorInventory (
    VendorID int  NOT NULL,
    ProductID int  NOT NULL,
    CONSTRAINT VendorInventory_pk PRIMARY KEY (VendorID)
);

CREATE TABLE Vendors (
    VendorID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Email varchar(255) NOT NULL,
    CONSTRAINT Vendors_pk PRIMARY KEY (VendorID)
);

CREATE TABLE Venue (
    VenueID int  NOT NULL,
    Name varchar(255)  NOT NULL,
    Address varchar(255)  NOT NULL,
    CONSTRAINT Venue_pk PRIMARY KEY (VenueID)
);

-- foreign keys
ALTER TABLE ArtistAlley ADD CONSTRAINT ArtistAlley_Venue FOREIGN KEY ArtistAlley_Venue (VenueID)
    REFERENCES Venue (VenueID);

ALTER TABLE Event ADD CONSTRAINT Event_Vendors FOREIGN KEY Event_Vendors (VendorID)
    REFERENCES Vendors (VendorID);

ALTER TABLE Event ADD CONSTRAINT Event_Venue FOREIGN KEY Event_Venue (VenueID)
    REFERENCES Venue (VenueID);

ALTER TABLE VendorArtistAlleys ADD CONSTRAINT VendorArtistAlleys_ArtistAlley FOREIGN KEY VendorArtistAlleys_ArtistAlley (ArtistAlleyID)
    REFERENCES ArtistAlley (ArtistAlleyID);

ALTER TABLE VendorArtistAlleys ADD CONSTRAINT VendorArtistAlleys_Vendors FOREIGN KEY VendorArtistAlleys_Vendors (VendorID)
    REFERENCES Vendors (VendorID);

ALTER TABLE VendorInventory ADD CONSTRAINT VendorInventory_Products FOREIGN KEY VendorInventory_Products (ProductID)
    REFERENCES Products (ProductID);

ALTER TABLE VendorInventory ADD CONSTRAINT VendorInventory_Vendors FOREIGN KEY VendorInventory_Vendors (VendorID)
    REFERENCES Vendors (VendorID);

-- sample data for Venues
INSERT INTO Venue (VenueID, Name, Address) VALUES
(1, 'Convention Center', '123 Main St'),
(2, 'Art Expo Hall', '456 Elm St');

--Sample data for ArtistAlley table
INSERT INTO ArtistAlley (ArtistAlleyID, VenueID, Name, Capacity) VALUES
VALUES (1, 1, 'Adam West Hall', 150),
VALUES (2, 1, 'Clint East Hall', 320),
VALUES (3, 1, 'Nolan North Hall', 190),
VALUES (4, 1, 'James South Hall', 55),
VALUES (5, 1, 'Centre Hall', 100);

--Sample data for Vendors 
INSERT INTO Vendors (VendorID, Name) VALUES
(1, 'Artistic Wonders'),
(2, 'Crafty Creations');

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
  (13, 'Magic Potions and Elixirs', 12.00, 'Novelty drinks with magical effects'),
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

-- Sample data for Vendors ArtistAlleys table
INSERT INTO VendorArtistAlleys (VendorID, ArtistAlleyID) VALUES
(1, 1),
(2, 2);

-- Sample data for Vendor Inventory table
INSERT INTO VendorInventory (VendorID, ProductID) VALUES
(1, 1),
(2, 2);

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