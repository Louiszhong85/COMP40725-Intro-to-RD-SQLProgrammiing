DROP
    DATABASE IF EXISTS Movies;
CREATE
    DATABASE Movies;
USE
    Movies;

CREATE TABLE features
(
    feature_id    INT AUTO_INCREMENT PRIMARY KEY,
    feature_title varchar(255)              NOT NULL,
    feature_year  YEAR                      NOT NULL,
    feature_type  ENUM ('Movie', 'TV_Show') NOT NULL
);

CREATE TABLE features_work
(
    work_id      INT AUTO_INCREMENT PRIMARY KEY,
    feature_id   INT                       NOT NULL,
    person_name  VARCHAR(255)              NOT NULL,
    feature_role ENUM ('Actor','Director') NOT NULL,
    FOREIGN KEY (feature_id) REFERENCES features (feature_id) ON DELETE CASCADE
);

CREATE TABLE features_role
(
    role_id        INT AUTO_INCREMENT PRIMARY KEY,
    work_id        INT          NOT NULL,
    character_name varchar(255) NOT NULL,
    FOREIGN KEY (work_id) REFERENCES features_work (work_id) ON DELETE CASCADE
);

INSERT INTO features (feature_title, feature_year, feature_type)
VALUES ('Dr. No', 1962, 'Movie'),
       ('From Russia with Love', 1963, 'Movie'),
       ('Goldfinger', 1964, 'Movie'),
       ('Thunderball', 1965, 'Movie'),
       ('You Only Live Twice', 1967, 'Movie'),
       ('On Her Majesty\'s Secret Service', 1969, 'Movie'),
       ('Diamonds Are Forever', 1971, 'Movie'),
       ('Live and Let Die', 1973, 'Movie'),
       ('The Man with the Golden Gun', 1974, 'Movie'),
       ('The Spy Who Loved Me', 1977, 'Movie'),
       ('Moonraker', 1979, 'Movie'),
       ('For Your Eyes Only', 1981, 'Movie'),
       ('Octopussy', 1983, 'Movie'),
       ('A View to a Kill', 1985, 'Movie'),
       ('The Living Daylights', 1987, 'Movie'),
       ('Licence to Kill', 1989, 'Movie'),
       ('GoldenEye', 1995, 'Movie'),
       ('Tomorrow Never Dies', 1997, 'Movie'),
       ('The World Is Not Enough', 1999, 'Movie'),
       ('Die Another Day', 2002, 'Movie'),
       ('Casino Royale', 2006, 'Movie'),
       ('Quantum of Solace', 2008, 'Movie'),
       ('Skyfall', 2012, 'Movie'),
       ('Spectre', 2015, 'Movie'),
       ('No Time to Die', 2021, 'Movie'),
       ('Iron Man', 2008, 'Movie'),
       ('The Incredible Hulk', 2008, 'Movie'),
       ('Iron Man 2', 2010, 'Movie'),
       ('Captain America: The First Avenger', 2011, 'Movie'),
       ('Captain America: Civil War', 2016, 'Movie'),
       ('Doctor Strange', 2016, 'Movie'),
       ('Guardians of the Galaxy Vol. 2', 2017, 'Movie'),
       ('Spider-Man: Homecoming', 2017, 'Movie'),
       ('Thor: Ragnarok', 2017, 'Movie'),
       ('Black Panther', 2018, 'Movie'),
       ('Avengers: Infinity War', 2018, 'Movie'),
       ('Ant-Man and the Wasp', 2018, 'Movie'),
       ('Captain Marvel', 2019, 'Movie'),
       ('The Simpsons', 1989, 'TV_Show'),
       ('Rick and Morty', 2013, 'TV_Show'),
       ('The Good Doctor', 2017, 'TV_Show'),
       ('Planet Earth II', 2016, 'TV_Show'),
       ('Breaking Bad', 2008, 'TV_Show'),
       ('Planet Earth', 2006, 'TV_Show'),
       ('Band of Brothers', 2001, 'TV_Show'),
       ('Chernobyl', 2019, 'TV_Show'),
       ('The Wire', 2002, 'TV_Show'),
       ('Blue Planet II', 2017, 'TV_Show'),
       ('Avatar: The Last Airbender', 2005, 'TV_Show'),
       ('Cosmos', 2014, 'TV_Show'),

       -- Daniel Craig from 51
       ('Knives Out', 2019, 'Movie'),
       ('Kings', 2017, 'Movie'),
       -- Sean Connery. from 53
       ('Sir Billi', 2012, 'Movie'),
       ('The League of Extraordinary Gentlemen', 2003, 'Movie'),
       ('Finding Forrester', 2000, 'Movie'),
       -- Terence Young  56
       ('Run for Your Life', 1988, 'Movie'),
       -- Guy Hamilton 57
       ('Try This One for Size', 1989, 'Movie'),
       ('The Intruder', 1953, 'Movie'),
       ('An Inspector Calls', 1954, 'Movie'),
       -- Lewis Gilbert 60
       ('Before You Go', 2022, 'Movie'),
       ('Haunted', 1995, 'Movie'),
       ('Stepping Out', 1991, 'Movie'),
       -- George Lazenby 63
       ('Passport to Oblivion', 2019, 'Movie'),
       ('Becoming Bond', 2017, 'Movie'),
       ('A Winter Rose', 2014, 'Movie'),
       ('Spider\'s Web', 2002, 'Movie'),
       -- Peter R. Hunt 67
       ('You Only Live Twice', 1967, 'Movie'),
       -- Roger Moore 68
       ('The Saint', 2017, 'Movie'),
       ('The Carer', 2017, 'Movie'),
       -- John Glen 70
       ('The Point Men', 2001, 'Movie'),
       -- Timothy Dalton 71
       ('The Rocketeer', 1991, 'Movie'),
       -- Pierce Brosnan 72
       ('Black Adam', 2022, 'Movie'),
       -- Martin Campbell 73
       ('Black Adam', 2022, 'Movie');


INSERT INTO features_work (feature_id, person_name, feature_role)
VALUES (1, 'Sean Connery', 'Actor'),
       (1, 'Terence Young', 'Director'),
       (2, 'Sean Connery', 'Actor'),
       (2, 'Terence Young', 'Director'),
       (3, 'Sean Connery', 'Actor'),
       (3, 'Guy Hamilton', 'Director'),
       (4, 'Sean Connery', 'Actor'),
       (4, 'Terence Young', 'Director'),
       (5, 'Sean Connery', 'Actor'),
       (5, 'Lewis Gilbert', 'Director'),
       (6, 'George Lazenby', 'Actor'),
       (6, 'Peter R. Hunt', 'Director'),
       (7, 'Sean Connery', 'Actor'),
       (7, 'Guy Hamilton', 'Director'),
       (8, 'Roger Moore', 'Actor'),
       (8, 'Guy Hamilton', 'Director'),
       (9, 'Roger Moore', 'Actor'),
       (9, 'Guy Hamilton', 'Director'),
       (10, 'Roger Moore', 'Actor'),
       (10, 'Lewis Gilbert', 'Director'),
       (11, 'Roger Moore', 'Actor'),
       (11, 'Lewis Gilbert', 'Director'),
       (12, 'Roger Moore', 'Actor'),
       (12, 'John Glen', 'Director'),
       (13, 'Roger Moore', 'Actor'),
       (13, 'John Glen', 'Director'),
       (14, 'Roger Moore', 'Actor'),
       (14, 'John Glen', 'Director'),
       (15, 'Timothy Dalton', 'Actor'),
       (15, 'John Glen', 'Director'),
       (16, 'Timothy Dalton', 'Actor'),
       (16, 'John Glen', 'Director'),
       (17, 'Pierce Brosnan', 'Actor'),
       (17, 'Martin Campbell', 'Director'),
       (18, 'Pierce Brosnan', 'Actor'),
       (18, 'Roger Spottiswoo', 'Director'),
       (19, 'Pierce Brosnan', 'Actor'),
       (19, 'JMichael Apted', 'Director'),
       (20, 'Pierce Brosnan', 'Actor'),
       (20, 'Lee Tamahori', 'Director'),
       (21, 'Daniel Craig', 'Actor'),
       (21, 'Martin Campbell', 'Director'),
       (22, 'Daniel Craig', 'Actor'),
       (22, 'Marc Forster', 'Director'),
       (23, 'Daniel Craig', 'Actor'),
       (23, 'Sam Mendes', 'Director'),
       (24, 'Daniel Craig', 'Actor'),
       (24, 'Sam Mendes', 'Director'),
       (25, 'Daniel Craig', 'Actor'),
       (25, 'Cary Joji Fukunaga', 'Director'),
       (26, 'Robert Downey Jr.', 'Actor'),
       (26, 'Jon Favreau', 'Director'),
       (27, 'Edward Norton.', 'Actor'),
       (27, 'Louis Leterrier', 'Director'),
       (28, 'Robert Downey Jr.', 'Actor'),
       (28, 'Jon Favreau', 'Director'),
       (29, 'Chris Evans', 'Actor'),
       (29, 'Joe Johnston', 'Director'),
       (30, 'Chris Evans', 'Actor'),
       (30, 'Anthony Russo', 'Director'),
       (30, 'Joe Russo', 'Director'),
       (31, 'Benedict Cumberbatch', 'Actor'),
       (31, 'Scott Derrickson', 'Director'),
       (32, 'Chris Pratt', 'Actor'),
       (32, 'James Gunn', 'Director'),
       (33, 'Tom Holland', 'Actor'),
       (33, 'Jon Watts', 'Director'),
       (34, 'Chris Hemsworth', 'Actor'),
       (34, 'Taika Waititi', 'Director'),
       (35, 'Chadwick Boseman', 'Actor'),
       (35, 'Ryan Coogler', 'Director'),
       (36, 'Robert Downey Jr.', 'Actor'),
       (36, 'Anthony Russo', 'Director'),
       (36, 'Joe Russo', 'Director'),
       (37, 'Paul Rudd', 'Actor'),
       (37, 'Peyton Reed', 'Director'),
       (38, 'Brie Larson', 'Actor'),
       (38, 'Anna Boden', 'Director'),
       (38, 'Ryan Fleck', 'Director'),
       (39, 'The Simpsons Faimily', 'Actor'),
       (49, 'Matt Groening', 'Director'),
       (40, 'Rick Sanchez', 'Actor'),
       (40, 'Justin Rolland', 'Director'),
       (40, 'Dan Hamon', 'Director'),
       (41, 'Freddie Highmore', 'Actor'),
       (41, 'David Shore', 'Director'),
       (42, 'David Attenborough', 'Actor'),
       (42, 'Justin Anderson', 'Director'),
       (43, 'Bryan Cranston', 'Actor'),
       (43, 'Michelle MacLaren', 'Director'),
       (44, 'Sigourney Weaver', 'Actor'),
       (44, 'Alastair Fothergill', 'Director'),
       (45, 'Scott Grimes', 'Actor'),
       (45, 'David Frankel', 'Director'),
       (46, 'Jessie Buckley', 'Actor'),
       (46, 'Johan Renck', 'Director'),
       (47, 'Dominic West', 'Actor'),
       (47, 'Joe Chappelle', 'Director'),
       (48, 'David Attenborough', 'Actor'),
       (48, 'Yoland Bosiger', 'Director'),
       (49, 'Dee Bradley Baker', 'Actor'),
       (49, 'Giancarlo Volpe', 'Director'),
       (50, 'Neil deGrasse Tyson', 'Actor'),
       (50, 'Brannon Braga', 'Director'),
       (51, 'Daniel Craig', 'Actor'),
       (51, 'Rian Johnson', 'Director'),
       (52, 'Daniel Craig', 'Actor'),
       (52, 'Deniz Gamze Ergüven', 'Director'),
       (53, 'Sean Connery', 'Actor'),
       (53, 'Sascha Hartmann', 'Director'),
       (54, 'Sean Connery', 'Actor'),
       (54, 'Stephen Norrington', 'Director'),
       (55, 'Sean Connery', 'Actor'),
       (55, 'Gus Van Sant', 'Director'),
       (56, 'David Carradine', 'Actor'),
       (56, 'Terence Young', 'Director'),
       (57, 'Michael Brandon', 'Actor'),
       (57, 'Guy Hamilton', 'Director'),
       (58, 'Jack Hawkins', 'Actor'),
       (58, 'Guy Hamilton', 'Director'),
       (59, 'Alastair Sim', 'Actor'),
       (59, 'Guy Hamilton', 'Director'),
       (60, 'Julie Walters', 'Actor'),
       (60, 'Lewis Gilbert', 'Director'),
       (61, 'Peter England', 'Actor'),
       (61, 'Lewis Gilbert', 'Director'),
       (62, 'Liza Minnelli', 'Actor'),
       (62, 'Lewis Gilbert', 'Director'),
       (63, 'George Lazenby', 'Actor'),
       (63, 'Barnaby Eaton-Jones', 'Director'),
       (64, 'George Lazenby', 'Actor'),
       (64, 'Josh Greenbaum', 'Director'),
       (65, 'George Lazenby', 'Actor'),
       (65, 'Riz Story', 'Director'),
       (66, 'George Lazenby', 'Actor'),
       (66, 'Paul Levine', 'Director'),
       (67, 'Akiko Wakabayashi', 'Actor'),
       (67, 'Lewis Gilbert', 'Director'),
       (68, 'Roger Moore', 'Actor'),
       (68, 'Ernie Barbarash', 'Director'),
       (69, 'Roger Moore', 'Actor'),
       (69, 'János Edelényi', 'Director'),
       (70, 'Christopher Lambert', 'Actor'),
       (70, 'John Glen', 'Director'),
       (71, 'Timothy Dalton', 'Actor'),
       (71, 'Joe Johnston', 'Director'),
       (72, 'Pierce Brosnan', 'Actor'),
       (72, 'Jaume Collet-Serra', 'Director'),
       (73, 'Liam Neeson', 'Actor'),
       (73, 'Martin Campbell', 'Director');

INSERT INTO features_role (work_id, character_name)
VALUES (1, 'James Bond'),
       (3, 'James Bond'),
       (5, 'James Bond'),
       (7, 'James Bond'),
       (9, 'James Bond'),
       (11, 'James Bond'),
       (13, 'James Bond'),
       (15, 'James Bond'),
       (17, 'James Bond'),
       (19, 'James Bond'),
       (21, 'James Bond'),
       (23, 'James Bond'),
       (25, 'James Bond'),
       (27, 'James Bond'),
       (29, 'James Bond'),
       (31, 'James Bond'),
       (33, 'James Bond'),
       (35, 'James Bond'),
       (37, 'James Bond'),
       (39, 'James Bond'),
       (41, 'James Bond'),
       (43, 'James Bond'),
       (45, 'James Bond'),
       (47, 'James Bond'),
       (49, 'James Bond'),
       (51, 'Tony Stark/Iron man'),
       (53, 'Bruce Banner/Hulk'),
       (55, 'Tony Stark/Iron man'),
       (57, 'Steve Rogers/Captain America'),
       (59, 'Steve Rogers/Captain America'),
       (62, 'neurosurgeon Stephen Strange'),
       (64, 'Peter Quill / Star-Lord'),
       (66, 'Peter Parker / Spider-Man'),
       (68, 'Thor alongside'),
       (70, 'T\'Challa / Black Panther'),
       (72, 'Tony Stark/Iron man'),
       (75, 'Scott Lang/Ant-Man'),
       (77, 'Carol Danvers/Captain Marvel'),
       (80, 'Simpsons'),
       (82, 'Rick Sanchez'),
       (85, 'Shaun Murphy'),
       (87, 'Self - Narrator'),
       (89, 'Walter White'),
       (91, 'Narrator - US Version'),
       (93, 'Donald G. Malarkey'),
       (95, 'Lyudmilla Ignatenko'),
       (97, 'Detective James Jimmy McNulty'),
       (99, 'Self - Narrator'),
       (101, 'Appa'),
       (103, 'Self - Host'),
       (105, 'Blanc'),
       (107, 'Obie Hardison'),
       (109, 'Sir Billi'),
       (111, 'Allan Quatermain'),
       (113, 'William Forrester'),
       (115, 'Major Charles Forsythe'),
       (117, 'Tom Lepski'),
       (119, 'Wolf Merton'),
       (121, 'Inspector Poole'),
       (123, 'Teresa'),
       (123, 'Young David Ash 12'),
       (125, 'Mavis Turner'),
       (127, 'Dr Jason Love'),
       (129, 'George Lazenby'),
       (131, 'Henry'),
       (133, 'Leland De Winter'),
       (135, 'Aki'),
       (137, 'Jasper'),
       (139, 'Roger Moore'),
       (141, 'Tony Eckhardt'),
       (143, 'Neville Sinclair'),
       (145, 'Kent Nelson / Doctor Fate'),
       (147, 'Alex Lewis');

/*
Q1: Define a view called Bond_movies that lists everyone that has ever worked on a Bond movie by their role in the movies,
providing a count for the number of times they have filled that role in a Bond movie.
Make sure the view is ordered from highest count first to lowest count last.

*/


CREATE VIEW Bond_movies AS
SELECT person_name  AS person,
       feature_role AS job,
       COUNT(*)     AS count
FROM features_work
WHERE feature_id IN (SELECT feature_id
                     FROM features_work,
                          features_role
                     WHERE features_work.work_id = features_role.work_id
                       AND features_role.character_name = 'James Bond')
GROUP BY person_name,
         feature_role
ORDER BY count DESC;


/*
 Q2:  Define a view that will tell us how many times a given actor has worked with a particular director,
 and vice versa. Make sure the view is ordered from highest count first to lowest count last.
 */
CREATE VIEW feature_work_together AS
SELECT f1.person_name AS person1,
       f2.person_name AS person2,
       COUNT(*)       AS count
FROM features_work f1,
     features_work f2
WHERE f1.feature_id = f2.feature_id
  AND f1.feature_role < f2.feature_role
GROUP BY person1,
         person2,
         f1.feature_role,
         f2.feature_role
ORDER BY count DESC;


/*
    Q3. Define a view that indicates how much of their career an actor or director has spent working on Bond movies.
    For instance, if an actor has made 10 movies and 4 of them are Bond movies, then this percentage is 40%.
    Likewise for a director. Order the rows by ascending (not descending) percentages.
 */
CREATE VIEW bond_work_rate AS
SELECT Bond_movies.person,
       Bond_movies.job,
       ROUND((Bond_movies.count / COUNT(*)) * 100) AS percentage
FROM Bond_movies,
     features_work
WHERE Bond_movies.person = features_work.person_name
  AND Bond_movies.job = features_work.feature_role
GROUP BY features_work.person_name,
         features_work.feature_role
ORDER BY percentage ASC;


/*
    Q4: Define a view that shows the percentage of their career that an actor has spent working with a director, or vice versa.
    For instance, Daniel Craig has worked once with the director Cary Joji Fukunaga, once with director Martin Campbell,
    once with director Marc Forster, twice with director Sam Mendes, and twice with director Rian Johnson. Conversely,
    our DB lists Rian Johnson as directing only two films.
    So Daniel Craig has spent 14% of his career working with  Martin Campbell and 29% of his career (rounded off) with Rian Johnson,
    while Rian Johnson has spent 100% of his career directing Daniel Craig.
 */

CREATE VIEW count AS
SELECT person_name,
       feature_role,
       COUNT(*) AS count
FROM features_work
GROUP BY person_name,
         feature_role;

CREATE VIEW career_relate AS
SELECT person1,
       person2,
       ROUND(fw.count / c1.count * 100) as percent1,
       ROUND(fw.count / c2.count * 100) as percent2
FROM feature_work_together fw,
     count c1,
     count c2
WHERE fw.person1 = c1.person_name
  AND fw.person2 = c2.person_name
  AND c1.feature_role < c2.feature_role;

-- Q1.Bond_movies
SELECT *
FROM Bond_movies;

-- Q2.feature_work_together
SELECT *
FROM feature_work_together;

-- Q3.bond_work_rate
SELECT *
FROM bond_work_rate;

-- Q4.career_relate
SELECT *
FROM career_relate;