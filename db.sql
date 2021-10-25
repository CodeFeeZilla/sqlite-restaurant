-- Create Tables --
CREATE TABLE Restaurants (
  restaurant_id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  imagelink TEXT
);

CREATE TABLE Menus (
  menu_id INTEGER NOT NULL PRIMARY KEY,
  title TEXT,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE MenuItems (
  item_id INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  price INTEGER,
  menu_id INTEGER NOT NULL,
  FOREIGN KEY (menu_id) REFERENCES Menus(menu_id)
);
-- End of Creation --

-- Insert Entries (rows) into
  -- Restaurants
INSERT INTO Restaurants (name, imagelink) VALUES ("SpagBrillo", "image1.jpg");

  -- Menus
INSERT INTO Menus (title, restaurant_id) 
VALUES ("Super Saver", 1);

  -- MenuItems
INSERT INTO MenuItems (name, price, menu_id)
VALUES ("Plain Spaghetti", 1, 1);
INSERT INTO MenuItems (name, price, menu_id)
VALUES ("Plain Pasta", 3, 1);
-- End Of Insert --

SELECT name FROM sqlite_master WHERE type='table';
-- Read Back data from
  -- Restaurants
SELECT * from Restaurants;

  --Menus
SELECT * from Menus;

  --MenuItems
SELECT * from MenuItems;
-- End of Read --

-- UPDATE rows of
  -- Restaurants
UPDATE Restaurants SET restaurant_id=2 where restaurant_id=1;
  --Menus
UPDATE Menus SET title="Mister Menu" WHERE title="Super Saver";
  --MenuItems
UPDATE MenuItems SET price=1000 where item_id=1;


-- Read Back data after updates from
  -- Restaurants
SELECT * from Restaurants;

  --Menus
SELECT * from Menus;

  --MenuItems
SELECT * from MenuItems;
-- End of Read --

-- DELETE and Filter 
DELETE from MenuItems WHERE name="Plain Pasta";
-- Read Back entries in MenuItems
SELECT * FROM MenuItems;
