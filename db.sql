.headers on
PRAGMA foreign_keys = on;

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
INSERT INTO Restaurants (name, imagelink) VALUES ("FoodMaven", "genericimage.jpg");

  -- Menus
INSERT INTO Menus (title, restaurant_id) 
VALUES ("Super Saver", 1);
INSERT INTO Menus (title, restaurant_id) 
VALUES ("Maven Menu", 2);

  -- MenuItems
INSERT INTO MenuItems (name, price, menu_id)
VALUES ("Plain Spaghetti", 1, 1);
INSERT INTO MenuItems (name, price, menu_id)
VALUES ("Plain Pasta", 3, 1);
INSERT INTO MenuItems (name, price, menu_id)
VALUES ("Flour, just flour", 43, 2);
INSERT INTO MenuItems (name, price, menu_id)
VALUES ("Sweet Sugar", 56, 2);
-- End Of Insert --

-- Joins --
-- SELECT the name of a menu from a specific restaurant and list all the menu items on this menu

SELECT title, name FROM Menus
JOIN MenuItems ON
Menus.id = MenuItems.menu_id
WHERE title = "Super Saver";


-- --SELECT all the restaurants with a count of the number of menus each restaurant has. Hint: you will need to use the COUNT and GROUP BY keywords.

SELECT name, COUNT(title) FROM
Restaurants JOIN
Menus on Restaurants.id = Menus.restaurant_id
GROUP BY name;

-- -- SELECT all the menus, with the total cost of all the menu items summed, and have the list in descending order (most expensive first). Hint: you will need to use the SUM, GROUP BY and ORDER BY keywords

SELECT title, SUM(price) FROM
Menus JOIN MenuItems ON
Menus.id = MenuItems.menu_id
GROUP BY title ORDER BY price DESC;
-- End of Joins --