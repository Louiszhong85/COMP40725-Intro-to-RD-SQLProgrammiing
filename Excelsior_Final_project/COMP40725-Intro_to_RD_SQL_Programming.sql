DROP
    DATABASE IF EXISTS excelsior;

-- 创建数据库
CREATE DATABASE excelsior;

-- 使用数据库
USE excelsior;

-- Create a publisher table to store publisher information.
CREATE TABLE publishers
(
    id      INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(255) UNIQUE NOT NULL,
    address VARCHAR(255),
    mail    VARCHAR(255),
    country VARCHAR(100)

);

-- Create a comic book series table
CREATE TABLE comic_series
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) UNIQUE NOT NULL,
    start_year  INT,
    end_year    Int,
    description TEXT
);


-- Create a comic table to store information about the comic
CREATE TABLE comics
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    type            ENUM ('comic_issue', 'graphic_novel'),
    title           VARCHAR(255) UNIQUE NOT NULL,
    publish_date    DATE         NOT NULL,
    publish_version VARCHAR(100) NOT NULL,
    ISBN            VARCHAR(255) UNIQUE,
    publisher_id    INT          NOT NULL,
    series_id       INT, -- 添加series_id字段
    FOREIGN KEY (publisher_id) REFERENCES publishers (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (series_id) REFERENCES comic_series (id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create a character table to store information about the characters in the comic
CREATE TABLE characters
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) UNIQUE,
    description TEXT
);

-- Create a character association table to link comics and characters and store which character appears in which comic.
CREATE TABLE comic_characters
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    comic_id     INT NOT NULL,
    character_id INT NOT NULL,
    FOREIGN KEY (comic_id) REFERENCES comics (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (character_id) REFERENCES characters (id) ON DELETE CASCADE ON UPDATE CASCADE
);

--  Create an artist table to store information about comic artists
CREATE TABLE writers
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

-- Create an artist association table to connect the comic to the artist and store which artist is responsible for which comic.
CREATE TABLE comic_writers
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    comic_id  INT,
    writer_id INT,
    FOREIGN KEY (comic_id) REFERENCES comics (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (writer_id) REFERENCES writers (id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Create an inventory table to store information about the comic inventory, such as comic ID, quality, purchase price and sale price.
CREATE TABLE inventory
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    comic_id       INT            NOT NULL,
    quality        DECIMAL(2, 1)  NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL,
    sale_price     DECIMAL(10, 2) NOT NULL,
    stock          INT            NOT NULL,
    FOREIGN KEY (comic_id) REFERENCES comics (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- mapping condition
CREATE TABLE mapping_condition
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    comics_condition ENUM ('MT', 'NM','VF','FN','VG','GD','FR','PR'),
    inventory_id        INT     NOT NULL ,
    FOREIGN KEY (inventory_id) REFERENCES inventory (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create a role table to store information about user roles, such as role names.
CREATE TABLE roles
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)  UNIQUE NOT NULL UNIQUE
);

-- User table, which stores information about the user such as username, email, password hash, first name, surname, phone number and role ID.
CREATE TABLE users
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(255) UNIQUE NOT NULL UNIQUE,
    email         VARCHAR(255) UNIQUE NOT NULL UNIQUE,
    password_hash CHAR(64)     NOT NULL,
    first_name    VARCHAR(255) NOT NULL,
    last_name     VARCHAR(255) NOT NULL,
    phone_number  VARCHAR(20),
    role_id       INT,
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create a delivery address table to store the user's delivery address information such as street address, city, state/province, postcode and country.
CREATE TABLE addresses
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    user_id        INT,
    street_address VARCHAR(255),
    city           VARCHAR(255),
    state          VARCHAR(255),
    postal_code    VARCHAR(255),
    country        VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- The Orders table, which stores information about user orders, such as user ID, order date and total price.
CREATE TABLE orders
(
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    order_date  DATETIME,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- The order items table, which stores information about the comics in the order, such as order ID, comic ID, quantity and price.
CREATE TABLE order_items
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    comic_id INT,
    quantity INT,
    price    DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (comic_id) REFERENCES comics (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Shopping cart table, which stores information about the comics in the user's shopping cart, such as user ID, comic ID and quantity.
CREATE TABLE shopping_cart
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    user_id  INT NOT NULL,
    comic_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (comic_id) REFERENCES comics (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- wishlist：Wishlist table, storing information about the comics in the user's wishlist, such as user ID and comic ID
CREATE TABLE wishlist
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    user_id  INT NOT NULL,
    comic_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (comic_id) REFERENCES comics (id)
);


INSERT INTO publishers (name, address, mail, country)
VALUES ('Marvel Comics', '135 W 50th Street, New York, NY', 'contact@marvel.com', 'USA'),
       ('DC Comics', '1700 Broadway, New York, NY', 'contact@dccomics.com', 'USA'),
       ('Dark Horse Comics', '10956 SE Main St., Milwaukie, OR', 'contact@darkhorse.com', 'USA'),
       ('Image Comics', '1942 University Ave, Berkeley, CA', 'contact@imagecomics.com', 'USA'),
       ('IDW Publishing', '2765 Truxtun Road, San Diego, CA', 'contact@idwpublishing.com', 'USA'),
       ('Valiant Entertainment', '350 7th Ave, New York, NY', 'contact@valiantentertainment.com', 'USA'),
       ('Boom! Studios', '5670 Wilshire Blvd, Los Angeles, CA', 'contact@boom-studios.com', 'USA'),
       ('Dynamite Entertainment', '155 W 60th Street, New York, NY', 'contact@dynamite.com', 'USA'),
       ('Oni Press', '1305 SE Martin Luther King Jr Blvd, Portland, OR', 'contact@onipress.com', 'USA'),
       ('Titan Comics', '144 Southwark Street, London', 'contact@titan-comics.com', 'UK'),
       ('VIZ Media', 'PO Box 77010, San Francisco, CA', 'contact@viz.com', 'USA'),
       ('Kodansha Comics', '1-2-7 Yushima, Bunkyo-ku, Tokyo', 'contact@kodansha.com', 'Japan'),
       ('Yen Press', '345 Hudson Street, New York, NY', 'contact@yenpress.com', 'USA'),
       ('Seven Seas Entertainment', '17203 Vermont Ave, Gardena, CA', 'contact@sevenseasentertainment.com', 'USA'),
       ('Fantagraphics Books', '7563 Lake City Way NE, Seattle, WA', 'contact@fantagraphics.com', 'USA');

-- 插入漫画系列数据
INSERT INTO comic_series (title, start_year, end_year, description)
VALUES ('The Amazing Spider-Man', 1963, 1998, 'The Amazing Spider-Man (1963 - 1998)'),
       ('Batman', 1939, NULL, 'The ongoing adventures of Bruce Wayne, also known as Batman.'),
       ('Superman', 1939, NULL, 'The ongoing adventures of Clark Kent, also known as Superman.'),
       ('X-Men', 1963, NULL, 'The ongoing adventures of a group of mutants fighting for peace and equality.'),
       ('Green Lantern', 1941, NULL,
        'The ongoing adventures of various characters wielding the Green Lantern power ring.'),
       ('Iron Man', 1968, NULL, 'The ongoing adventures of Tony Stark, also known as Iron Man.'),
       ('Wonder Woman', 1942, NULL, 'The ongoing adventures of Diana Prince, also known as Wonder Woman.'),
       ('The Flash', 1959, NULL, 'The ongoing adventures of Barry Allen, also known as The Flash.'),
       ('Captain America', 1968, NULL, 'The ongoing adventures of Steve Rogers, also known as Captain America.'),
       ('Daredevil', 1964, NULL, 'The ongoing adventures of Matt Murdock, also known as Daredevil.'),
       ('Justice League', 1960, NULL,
        'The ongoing adventures of DC Comics\' greatest heroes, working together to save the world.'),
       ('The Avengers', 1963, NULL,
        'The ongoing adventures of Marvel Comics\' greatest heroes, working together to save the world.'),
       ('The Incredible Hulk', 1962, NULL, 'The ongoing adventures of Bruce Banner, also known as The Hulk.'),
       ('The Walking Dead', 2003, 2019,
        'A post-apocalyptic comic series about a group of survivors in a world overrun by zombies.'),
       ('Saga', 2012, NULL,
        'An epic space opera/fantasy series depicting the adventures of two star-crossed lovers and their family.'),
       ('Ant-Man Vol 1', 2015, 2015,
        'Discover Scott Lang''s journey from thief to hero, as he dons the Ant-Man suit to combat evil in this thrilling adventure.'),
       ('Secret Avengers Vol', 2015, NULL,
        'The ongoing comic'),
	   ('Amazing Spider-Man Coming Home',2001,2001,'This is graphic_novel '),
       ('Amazing Spider-Man Revealations',2002,2002,'This is graphic_novel '),
       ('Amazing Spider-Man Until the Stars Turn Cold',2002,2002,'This is graphic_novel '),
       ('Amazing Spider-Man Life & Death of Spiders',2003,2003,'This is graphic_novel '),
       ('Amazing Spider-Man Unintended Consequences',2003,2003,'This is graphic_novel ');

-- 插入漫画数据
INSERT INTO comics (type, title, publish_date, publish_version, ISBN, publisher_id, series_id)
VALUES ('comic_issue', 'The Amazing Spider-Man Vol 1 #1', '1963-03-01', '1', '001-1963-ASM', 1, 1),
       ('comic_issue', 'Batman Vol 1 #1', '1940-04-25', '1', '001-1940-BM', 2, 2),
       ('comic_issue', 'Superman  Vol 1#1', '1939-06-01', '1', '001-1939-SM', 2, 3),
       ('comic_issue', 'X-Men Vol 1 #1', '1963-09-01', '1', '001-1963-XM', 1, 4),
       ('comic_issue', 'Green Lantern Vol 1 #1', '1941-07-01', '1', '001-1941-GL', 2, 5),
       ('comic_issue', 'Iron Man Vol 1 #1', '1968-05-01', '1', '001-1968-IM', 1, 6),
       ('comic_issue', 'Wonder Woman Vol 1 #1', '1942-07-01', '1', '001-1942-WW', 2, 7),
       ('comic_issue', 'The Flash Vol 1 #1', '1959-10-01', '1', '001-1959-TF', 2, 8),
       ('comic_issue', 'Captain America Vol 1 #100', '1968-04-01', '1', '100-1968-CA', 1, 9),
       ('comic_issue', 'Daredevil Vol 1 #1', '1964-04-01', '1', '001-1964-DD', 1, 10),
       ('comic_issue', 'Justice League Vol 1 #1', '1960-10-01', '1', '001-1960-JL', 2, 11),
       ('comic_issue', 'The Avengers Vol 1 #1', '1963-09-01', '1', '001-1963-AV', 1, 12),
       ('comic_issue', 'The Incredible Hulk Vol 1 #1', '1962-05-01', '1', '001-1962-IH', 1, 13),
       ('comic_issue', 'The Walking Dead Vol 1 #1', '2003-10-01', '1', '001-2003-TWD', 4, 14),
       ('comic_issue', 'Saga Vol 1 #1', '2012-03-01', '1', '001-2012-S', 4, 15),
       ('comic_issue', 'Ant-Man Vol 1 #1', '2015-01-07', '1', '001-2012-S-1', 1, 16),
       ('comic_issue', 'Ant-Man Vol 1 #2', '2015-02-04', '1', '001-2012-S-2', 1, 16),
       ('comic_issue', 'Ant-Man Vol 1 #3', '2015-03-11', '1', '001-2012-S-3', 1, 16),
       ('comic_issue', 'Ant-Man Vol 1 #4', '2015-04-08', '1', '001-2012-S-4', 1, 16),
       ('comic_issue', 'Ant-Man Vol 1 #5', '2015-05-06', '1', '001-2012-S-5', 1, 16),
       ('comic_issue', 'Secret Avengers Vol 1 #15', '2011-07-26', '1', '001-2011-S-5', 1, 17),
       ('graphic_novel','Amazing Spider-Man Coming Home','2001-09-01','1','003-2011-g-5',1,18),
       ('graphic_novel','Amazing Spider-Man Revealations','2002-07-31','1','003-2011-g-543',1,19),
       ('graphic_novel','Amazing Spider-Man Until the Stars Turn Cold','2002-07-19','1','003-2001-g-5',1,20),
       ('graphic_novel','Amazing Spider-Man Life & Death of Spiders','2003-08-21','1','003-2011-g-532',1,21),
       ('graphic_novel','Amazing Spider-Man Unintended Consequences','2003-09-28','1','003-2011-g-5324',1,22);

       

-- 插入角色数据
INSERT INTO characters (name, description)
VALUES ('Spider-Man', 'Peter Parker, a young man with spider-like abilities and a strong sense of responsibility.'),
       ('Batman', 'Bruce Wayne, a billionaire playboy who becomes a crime-fighting vigilante at night.'),
       ('Superman', 'Clark Kent, an alien with incredible powers who protects Earth and fights for truth and justice.'),
       ('Wolverine',
        'A mutant with animal-like senses, enhanced physical capabilities, and a regenerative healing factor.'),
       ('Green Lantern', 'A title given to various characters who wield a powerful green energy ring.'),
       ('Iron Man', 'Tony Stark, a genius inventor who creates a suit of armor with incredible technology.'),
       ('Wonder Woman', 'Diana Prince, an Amazonian princess with incredible strength, speed, and combat skills.'),
       ('The Flash', 'Barry Allen, a man with the ability to move at incredible speeds.'),
       ('Captain America', 'Steve Rogers, a super soldier who fights for freedom and justice.'),
       ('Daredevil', 'Matt Murdock, a blind lawyer who gains superhuman senses and becomes a vigilante.'),
       ('Thor', 'The god of thunder from Norse mythology, wielding a powerful hammer called Mjolnir.'),
       ('Black Widow', 'Natasha Romanoff, a highly skilled spy and former KGB operative.'),
       ('Hulk', 'Bruce Banner, a scientist who transforms into a giant green monster when angry or stressed.'),
       ('Rick Grimes',
        'A small-town sheriff who becomes the leader of a group of survivors in a post-apocalyptic world.'),
       ('Alana', 'A character from the comic series Saga, who is a soldier from the planet Landfall.'),
       ('Ant-Man', 'A character from the comic series Ant - Man.'),
       ('beetle', 'A character from the comic series Ant - Man. Antagonists'),
       ('Midasbot', 'A character from the comic series Ant - Man. Antagonists'),
       ('Augustine Cross', 'A character from the comic series Ant - Man. Antagonists');

-- 插入角色关联数据
INSERT INTO comic_characters (comic_id, character_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 3),
       (11, 2),
       (11, 8),
       (11, 5),
       (11, 7),
       (12, 6),
       (12, 9),
       (12, 11),
       (12, 1),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (16, 17),
       (17, 16),
       (17, 18),
       (18, 16),
       (19, 16),
       (20, 16),
       (21, 19),
       (22,1),
       (23,1),
       (24,1),
       (25,1),
       (26,1);

-- 插入艺术家数据
INSERT INTO writers (name, description)
VALUES ('Stan Lee',
        'An iconic comic book writer, editor, and publisher who co-created many of Marvel''s most famous characters.'),
       ('Jack Kirby',
        'A legendary comic book artist and writer who co-created many of Marvel''s and DC''s iconic characters.'),
       ('Steve Ditko', 'A renowned comic book artist and writer, co-creator of Spider-Man and Doctor Strange.'),
       ('Neal Adams',
        'An influential comic book artist known for his work on Batman, Green Lantern/Green Arrow, and X-Men.'),
       ('Frank Miller',
        'A comic book writer, artist, and filmmaker known for his work on Daredevil, Batman, and Sin City.'),
       ('Jim Lee', 'A comic book artist, writer, and editor known for his work on X-Men, Batman, and the WildC.A.T.s.'),
       ('John Romita Jr.', 'A comic book artist known for his work on Spider-Man, Iron Man, and Kick-Ass.'),
       ('Alex Ross',
        'An acclaimed comic book artist known for his realistic and painted artwork on Marvels and Kingdom Come.'),
       ('Brian K. Vaughan', 'A comic book writer known for his work on Y: The Last Man, Ex Machina, and Saga.'),
       ('Fiona Staples', 'A comic book artist known for her work on North 40, Archie, and Saga.'),
       ('Robert Kirkman', 'A comic book writer and creator of The Walking Dead, Invincible, and Outcast.'),
       ('Charlie Adlard',
        'A comic book artist known for his work on The Walking Dead, Savage, and Astronauts in Trouble.'),
       ('Nick Spencer',
        'A comic book artist known for his work on The Anti-man.'),
       ('J. Michael Straczynski','A Graphic Novels book artist known for his work on The Amazing Spider-Man.');

-- 插入艺术家关联数据
INSERT INTO comic_writers (comic_id, writer_id)
VALUES (1, 1),
       (1, 2),
       (2, 4),
       (3, 1),
       (3, 2),
       (4, 1),
       (4, 2),
       (5, 2),
       (5, 3),
       (6, 1),
       (6, 2),
       (7, 1),
       (7, 2),
       (8, 1),
       (8, 3),
       (9, 1),
       (9, 2),
       (10, 5),
       (11, 4),
       (12, 1),
       (12, 2),
       (13, 1),
       (13, 2),
       (14, 11),
       (14, 12),
       (15, 9),
       (15, 10),
       (16, 13),
       (17, 13),
       (18, 13),
       (19, 13),
       (20, 13),
       (21, 13),
       (22,14),
	   (23,14),
       (24,14),
       (25,14),
       (26,14);

-- 插入库存数据
INSERT INTO inventory (comic_id, quality, purchase_price, sale_price, stock)
VALUES (1, 9.8, 800.00, 1000.00, 2),
       (2, 8.5, 300.00, 450.00, 3),
       (3, 6.0, 120.00, 180.00, 1),
       (4, 7.5, 150.00, 220.00, 1),
       (5, 5.5, 50.00, 100.00, 1),
       (6, 9.0, 400.00, 600.00, 4),
       (7, 4.5, 40.00, 80.00, 2),
       (8, 9.4, 700.00, 900.00, 3),
       (9, 8.0, 250.00, 400.00, 6),
       (10, 6.5, 100.00, 150.00, 1),
       (11, 9.2, 600.00, 800.00, 5),
       (12, 7.0, 200.00, 300.00, 1),
       (13, 8.5, 350.00, 500.00, 1),
       (14, 9.6, 750.00, 950.00, 1),
       (15, 7.5, 180.00, 250.00, 1),
       (16, 9.5, 180.00, 250.00, 5),
       (17, 8.5, 180.00, 250.00, 3),
       (18, 7.5, 180.00, 250.00, 2),
       (19, 8.5, 180.00, 250.00, 1);

INSERT INTO mapping_condition(comics_condition,inventory_id )
VALUES ('NM',1),
       ('VF',2),
       ('FN',3),
       ('FN',4),
       ('VG',5),
       ('VF',6),
       ('VG',7),
       ('VF',8),
       ('VF',9),
       ('FN',10),
       ('VF',11),
       ('FN',12),
       ('VF',13),
       ('NM',14),
       ('FN',15),
       ('NM',16),
       ('VF',17),
       ('FN',18),
       ('VF',19);
       
-- 插入角色数据
INSERT INTO roles (name)
VALUES ('Administrator'),
       ('Editor'),
       ('User');

-- 插入用户数据
INSERT INTO users (username, email, password_hash, first_name, last_name, phone_number, role_id)
VALUES ('admin', 'admin@example.com', '123456', 'John', 'Doe', '555-123-4567', 1),
       ('editor', 'editor@example.com', '12345634223', 'Jane', 'Doe', '555-123-7654', 2),
       ('user1', 'user1@example.com', '123456234234', 'Alice', 'Smith', '555-123-9876', 3),
       ('user2', 'user2@example.com', '234324123456', 'Bob', 'Johnson', '555-123-4563', 3),
       ('user3', 'user3@example.com', '1234563454343', 'Carol', 'Williams', '555-123-6598', 3),
       ('user4', 'user4@example.com', 'sfdsasf', 'David', 'Brown', '555-123-2485', 3),
       ('user5', 'user5@example.com', '3432143214', 'Eve', 'Jones', '555-123-0147', 3),
       ('user6', 'user6@example.com', '61d6f0a', 'Frank', 'Miller', '555-123-6587', 3),
       ('user7', 'user7@example.com', '5f4dcc3b5a', 'Grace', 'Davis', '555-123-2541', 3),
       ('user8', 'user8@example.com', '6b86b273f', 'Harry', 'Garcia', '555-123-5478', 3),
       ('user9', 'user9@example.com', 'd4735e3a26', 'Ivy', 'Martinez', '555-123-2156', 3),
       ('user10', 'user10@example.com', '4e0740856', 'Jack', 'Hernandez', '555-123-7845', 3),
       ('user11', 'user11@example.com', 'ef2d127de37b942', 'Karen', 'Lopez', '555-123-8974', 3),
       ('user12', 'user12@example.com', 'b45cffe084dd', 'Leo', 'Gonzalez', '555-123-3578', 3),
       ('user13', 'user13@example.com', '4b227777d4dd1fc61c6', 'Mary', 'Wilson', '555-123-8923', 3),
       ('user14', 'user14@example.com', 'e7f6', 'David', 'Brown', '555-123-2485', 3),
       ('user15', 'user15@example.com', '7902699be42c8a8e4', 'Oliver', 'Thomas', '555-123-3258', 3);

INSERT INTO addresses (user_id, street_address, city, state, postal_code, country)
VALUES (1, '123 Main St', 'New York', 'NY', '10001', 'USA'),
       (2, '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
       (3, '789 Elm St', 'Chicago', 'IL', '60601', 'USA'),
       (4, '147 Maple St', 'Houston', 'TX', '77002', 'USA'),
       (5, '369 Pine St', 'Philadelphia', 'PA', '19102', 'USA'),
       (6, '582 Birch St', 'Phoenix', 'AZ', '85003', 'USA'),
       (7, '816 Cedar St', 'San Antonio', 'TX', '78205', 'USA'),
       (8, '1049 Willow St', 'San Diego', 'CA', '92101', 'USA'),
       (9, '1283 Poplar St', 'Dallas', 'TX', '75201', 'USA'),
       (10, '1517 Chestnut St', 'San Jose', 'CA', '95110', 'USA'),
       (11, '1741 Walnut St', 'Austin', 'TX', '78701', 'USA'),
       (12, '1965 Hawthorn St', 'Jacksonville', 'FL', '32202', 'USA'),
       (13, '2199 Linden St', 'San Francisco', 'CA', '94102', 'USA'),
       (14, '2433 Locust St', 'Indianapolis', 'IN', '46204', 'USA'),
       (15, '2667 Magnolia St', 'Columbus', 'OH', '43215', 'USA');

INSERT INTO orders (user_id, order_date, total_price)
VALUES (1, '2023-04-20 10:00:00', 2000.00),
       (2, '2023-04-20 11:30:00', 6300.00),
       (3, '2023-04-20 13:00:00', 440.00),
       (4, '2023-04-20 15:30:00', 100.00),
       (5, '2023-04-20 18:00:00', 760.00),
       (6, '2023-04-20 20:00:00', 1800.00),
       (7, '2023-04-20 21:30:00', 1000.00),
       (8, '2023-04-20 23:00:00', 1600.00),
       (9, '2023-04-21 09:00:00', 300.00),
       (3, '2019-04-20 13:00:00', 500.00),
       (4, '2018-04-20 15:30:00', 600.00),
       (5, '2001-04-20 18:00:00', 160.00),
       (6, '2004-04-20 20:00:00', 1800.00),
       (7, '2009-04-20 21:30:00', 600.00),
       (8, '2011-04-20 23:00:00', 1960.00);


INSERT INTO order_items (order_id, comic_id, quantity, price)
VALUES (1, 1, 2, 1000.00),
       (2, 2, 1, 450.00),
       (2, 3, 1, 180.00),
       (3, 4, 2, 220.00),
       (4, 5, 1, 100.00),
       (5, 6, 1, 600.00),
       (5, 7, 2, 80.00),
       (6, 8, 2, 900.00),
       (7, 9, 1, 400.00),
       (7, 10, 4, 150.00),
       (8, 11, 2, 800.00),
       (9, 12, 1, 300.00),
       (10, 13, 1, 500.00),
       (11, 6, 1, 600.00),
       (12, 7, 2, 80.00),
       (13, 8, 2, 900.00),
       (14, 6, 1, 600.00),
       (15, 7, 2, 80.00),
       (15, 8, 2, 900.00);


INSERT INTO shopping_cart (user_id, comic_id, quantity)
VALUES (1, 2, 1),
       (2, 4, 1),
       (3, 6, 1),
       (4, 8, 1),
       (5, 10, 1),
       (6, 12, 1),
       (7, 14, 1),
       (11, 1, 1),
       (12, 3, 1),
       (13, 5, 1),
       (14, 7, 1),
       (15, 9, 1);

INSERT INTO wishlist (user_id, comic_id)
VALUES (1, 3),
       (2, 5),
       (3, 7),
       (4, 9),
       (5, 11),
       (6, 13),
       (11, 2),
       (12, 4),
       (13, 6),
       (14, 8),
       (15, 10);


-- ****************************  4 Views   **************************


--  View 1 all Marvel Comics
CREATE VIEW find_publishers_comics AS
SELECT id, title
FROM comic_series
WHERE id in (SELECT series_id FROM comics 
WHERE publisher_id = (SELECT id FROM publishers  
WHERE name REGEXP '(?i)Marvel\\s+Comics'));

-- Examples for View 1
SELECT fpc.id, fpc.title, cs.start_year
FROM find_publishers_comics fpc
JOIN comic_series cs ON fpc.id = cs.id
WHERE cs.start_year >= 2000 AND cs.start_year <= 2023
ORDER BY cs.start_year ASC;


-- View 2 comics by relevant author
CREATE VIEW find_writer_comics AS
SELECT id,
       title
FROM comics
WHERE id IN (SELECT comic_id FROM comic_writers 
WHERE writer_id = (SELECT id FROM writers 
WHERE name REGEXP '^[Nn]ick\\s+[Ss]pencer$'));
       
-- Examples for View 2
SELECT * FROM find_writer_comics;


-- View 3 most valuable writers
CREATE VIEW most_valuable_writers AS
SELECT
    w.id AS writer_id,
    w.name AS writer_name,
    COUNT(oi.id) AS order_count,
    SUM(oi.price * oi.quantity) AS total_sales
FROM
    writers AS w,
    comic_writers AS cw,
    order_items AS oi
WHERE
    w.id = cw.writer_id AND cw.comic_id = oi.comic_id
GROUP BY
    w.id
ORDER BY
    order_count DESC,
    total_sales DESC;

-- Examples for View 3
SELECT * FROM most_valuable_writers LIMIT 5;

      
-- View 4 most valuable collected 
CREATE VIEW most_valuable_comics AS
SELECT 
    c.id AS comic_id,
    c.title AS comic_title,
    COUNT(oi.id) AS order_count,
    SUM(oi.price * oi.quantity) AS total_sales,
    AVG(inv.quality) AS avg_quality
FROM
    comics AS c,
    order_items AS oi,
    inventory AS inv,
    mapping_condition AS mc
WHERE c.id = oi.comic_id AND c.id = inv.comic_id AND inv.id = mc.inventory_id AND mc.comics_condition IN ('MT', 'NM','VF','FN','VG','GD','FR','PR')
GROUP BY
    c.id
ORDER BY
    order_count DESC, 
    total_sales DESC, 
    avg_quality DESC;
    
-- Examples for View 4
SELECT * FROM most_valuable_comics LIMIT 3;



-- ************************************* 4 PL/SQLs ********************************************************

-- Trigger 1.When new stock is added to the inventory table, mapping_condition is automatically added based on quality.
DELIMITER //
CREATE TRIGGER insert_mapping_condition_after_inventory
AFTER INSERT ON inventory
FOR EACH ROW
BEGIN
  DECLARE condition_code CHAR(2);

  CASE
    WHEN NEW.quality >= 10 THEN SET condition_code := 'MT';
    WHEN NEW.quality >= 9.5 THEN SET condition_code := 'NM';
    WHEN NEW.quality >= 8.0 THEN SET condition_code := 'VF';
    WHEN NEW.quality >= 6.0 THEN SET condition_code := 'FN';
    WHEN NEW.quality >= 4.0 THEN SET condition_code := 'VG';
    WHEN NEW.quality >= 2.2 THEN SET condition_code := 'GD';
    WHEN NEW.quality >= 1.0 THEN SET condition_code := 'FR';
    ELSE SET condition_code := 'PR';
  END CASE;

  INSERT INTO mapping_condition (inventory_id, comics_condition)
  VALUES (NEW.id, condition_code);
END;
//
DELIMITER ;

-- Test Data
-- INSERT INTO inventory (comic_id, quality, purchase_price, sale_price, stock) VALUES (9, 8.8, 1800.00, 1000.00, 2);


-- Trigger 2. Check if the publisher exists, if it does, prompt the user that the information exists, if it doesn't, execute the insert command
DELIMITER //
CREATE TRIGGER check_publisher_exists_before_insert
BEFORE INSERT ON publishers
FOR EACH ROW
BEGIN
  DECLARE publisher_exists INT;

  SELECT COUNT(*) INTO publisher_exists
  FROM publishers
  WHERE name = NEW.name;

  IF publisher_exists > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'The publisher already exists.';
  END IF;
END;
//
DELIMITER ;

-- Test data
-- INSERT INTO publishers (name, address, mail, country) VALUES ('Marvel Comics', '135 W 50th Street, New York, NY', 'contact@marvel.com', 'USA');


-- Trigger 3 Automatic alerts are sent to the administrator when the inventory of a comic falls below a certain threshold.
DELIMITER //
CREATE TRIGGER low_inventory_warning_after_update
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
  DECLARE threshold INT DEFAULT 5;
  DECLARE warning_message TEXT;
  DECLARE comic_title VARCHAR(255);

  SELECT title INTO comic_title FROM comics WHERE id = NEW.comic_id;

  IF NEW.stock < threshold THEN
    SET warning_message = CONCAT('Low inventory warning for comic ', comic_title, ' (ID: ', NEW.comic_id, ') is running low. Current quantity: ', NEW.stock);
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = warning_message;
  END IF;
END;
//
DELIMITER ;

-- Test data
-- UPDATE inventory SET stock = 2 WHERE comic_id = 1;


-- Trigger 4 When inserting a new comic into the comics table, check if the specified publisher_id and series_id exist in the publishers table and comic_series table.
DELIMITER //
CREATE TRIGGER check_publisher_and_series_before_insert
BEFORE INSERT ON comics
FOR EACH ROW
BEGIN
  DECLARE publisher_exists INT;
  DECLARE series_exists INT;

  -- Check if the publisher exists in the publishers table
  SELECT COUNT(*) INTO publisher_exists
  FROM publishers
  WHERE id = NEW.publisher_id;

  -- Check if the series exists in the comic_series table
  SELECT COUNT(*) INTO series_exists
  FROM comic_series
  WHERE id = NEW.series_id;

  -- If either the publisher or the series does not exist, raise an error
  IF publisher_exists = 0 OR series_exists = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The specified publisher or series does not exist.';
  END IF;

END;
//
DELIMITER ;

-- Test Data
-- INSERT INTO comics (type, title, publish_date, publish_version, ISBN, publisher_id, series_id) VALUES ('comic_issue', 'The Amazing Spider-Man Vol 1 #5', '1963-03-01', '1', '001-1963-ASM', 1, 100);

-- ************************************* 6 queries ********************************************************

-- Check the number of works by each author
SELECT writers.name,
       COUNT(comic_writers.comic_id) AS comic_count
FROM writers,
     comic_writers
WHERE writers.id = comic_writers.writer_id
GROUP BY writers.name
ORDER BY comic_count DESC;

-- Check how many comics each character has appeared in
SELECT characters.name,
       COUNT(comic_characters.comic_id) AS appearance_count
FROM characters,
     comic_characters
WHERE characters.id = comic_characters.character_id
GROUP BY characters.name
ORDER BY appearance_count DESC;

-- Find all comics in stock with the type comic_issue and sort them from highest to lowest number in stock.
SELECT c.title, i.stock
FROM comics c
INNER JOIN inventory i ON c.id = i.comic_id
WHERE c.type = 'comic_issue'
ORDER BY i.stock DESC;


-- Query the percentage of purchases per user for each publisher's comics
SELECT users.username,
       publishers.name AS publisher_name,
       ROUND((SUM(order_items.quantity) / (SELECT SUM(quantity) FROM order_items)) * 100,2) AS percentage
FROM users,
     orders,
     order_items,
     comics,
     publishers
WHERE users.id = orders.user_id
  AND orders.id = order_items.order_id
  AND order_items.comic_id = comics.id
  AND comics.publisher_id = publishers.id
GROUP BY users.username, publishers.name
ORDER BY percentage DESC, users.username DESC;


-- Query each user's total spend as a percentage of the order
SELECT users.username,
       ROUND((SUM(order_items.quantity * order_items.price) / 
              (SELECT SUM(quantity * price) FROM order_items)) * 100,2) AS percentage
FROM users,
     orders,
     order_items
WHERE users.id = orders.user_id
  AND orders.id = order_items.order_id
GROUP BY users.username
ORDER BY percentage DESC, users.username ASC;

-- Query each author's work as a percentage of all inventory
SELECT writers.name,
       ROUND((SUM(inventory.stock) / (SELECT SUM(stock) FROM inventory)) * 100,2) AS percentage
FROM writers,
     comic_writers,
     comics,
     inventory
WHERE writers.id = comic_writers.writer_id
  AND comic_writers.comic_id = comics.id
  AND comics.id = inventory.comic_id
GROUP BY writers.name
ORDER BY percentage DESC, writers.name ASC;

