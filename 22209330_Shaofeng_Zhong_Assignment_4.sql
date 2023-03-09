DROP DATABASE IF EXISTS cards;

CREATE DATABASE  cards;

USE cards;

CREATE TABLE standard_deck
(
    card_id   varchar(50) PRIMARY KEY UNIQUE NOT NULL,
    position  int                            NOT NULL,
    suit      varchar(50)                    NOT NULL,
    card_rank int                            NOT NULL,
    card_type varchar(50)                    NOT NULL
);

CREATE TABLE poker_values
(
    card_id    varchar(50) PRIMARY KEY NOT NULL,
    card_value int                     NOT NULL,
    foreign key (card_id) references standard_deck (card_id) ON DELETE CASCADE
);

CREATE TABLE blackjack_values
(
    card_id    varchar(50) NOT NULL,
    card_value int         NOT NULL,
    primary key (card_id, card_value),
    foreign key (card_id) references standard_deck (card_id) ON DELETE CASCADE
);

INSERT INTO standard_deck (card_id, position, suit, card_rank, card_type)
VALUES ("AH", 1, "Hearts", 1, "Number"),
       ("AD", 2, "Diamonds", 1, "Number"),
       ("AC", 3, "Clubs", 1, "Number"),
       ("AS", 4, "Spades", 1, "Number"),
       ("2H", 5, "Hearts", 2, "Number"),
       ("2D", 6, "Diamonds", 2, "Number"),
       ("2C", 7, "Clubs", 2, "Number"),
       ("2S", 8, "Spades", 2, "Number"),
       ("3H", 9, "Hearts", 3, "Number"),
       ("3D", 10, "Diamonds", 3, "Number"),
       ("3C", 11, "Clubs", 3, "Number"),
       ("3S", 12, "Spades", 3, "Number"),
       ("4H", 13, "Hearts", 4, "Number"),
       ("4D", 14, "Diamonds", 4, "Number"),
       ("4C", 15, "Clubs", 4, "Number"),
       ("4S", 16, "Spades", 4, "Number"),
       ("5H", 17, "Hearts", 5, "Number"),
       ("5D", 18, "Diamonds", 5, "Number"),
       ("5C", 19, "Clubs", 5, "Number"),
       ("5S", 20, "Spades", 5, "Number"),
       ("6H", 21, "Hearts", 6, "Number"),
       ("6D", 22, "Diamonds", 6, "Number"),
       ("6C", 23, "Clubs", 6, "Number"),
       ("6S", 24, "Spades", 6, "Number"),
       ("7H", 25, "Hearts", 7, "Number"),
       ("7D", 26, "Diamonds", 7, "Number"),
       ("7C", 27, "Clubs", 7, "Number"),
       ("7S", 28, "Spades", 7, "Number"),
       ("8H", 29, "Hearts", 8, "Number"),
       ("8D", 30, "Diamonds", 8, "Number"),
       ("8C", 31, "Clubs", 8, "Number"),
       ("8S", 32, "Spades", 8, "Number"),
       ("9H", 33, "Hearts", 9, "Number"),
       ("9D", 34, "Diamonds", 9, "Number"),
       ("9C", 35, "Clubs", 9, "Number"),
       ("9S", 36, "Spades", 9, "Number"),
       ("10H", 37, "Hearts", 10, "Number"),
       ("10D", 38, "Diamonds", 10, "Number"),
       ("10C", 39, "Clubs", 10, "Number"),
       ("10S", 40, "Spades", 10, "Number"),
       ("JH", 41, "Hearts", 11, "Face"),
       ("JD", 42, "Diamonds", 11, "Face"),
       ("JC", 43, "Clubs", 11, "Face"),
       ("JS", 44, "Spades", 11, "Face"),
       ("QH", 45, "Hearts", 12, "Face"),
       ("QD", 46, "Diamonds", 12, "Face"),
       ("QC", 47, "Clubs", 12, "Face"),
       ("QS", 48, "Spades", 12, "Face"),
       ("KH", 49, "Hearts", 13, "Face"),
       ("KD", 50, "Diamonds", 13, "Face"),
       ("KC", 51, "Clubs", 13, "Face"),
       ("KS", 52, "Spades", 13, "Face");

INSERT INTO poker_values (card_id, card_value)
VALUES 
("AH", 14),("AD", 14),("AC", 14),("AS", 14),
("2H", 2),("2D", 2),("2C", 2),("2S", 2),
("3H", 3),("3D", 3),("3C", 3),("3S", 3),
("4H", 4),("4D", 4),("4C", 4),("4S", 4),
("5H", 5),("5D", 5),("5C", 5),("5S", 5),
("6H", 6),("6D", 6),("6C", 6),("6S", 6),
("7H", 7),("7D", 7),("7C", 7),("7S", 7),
("8H", 8),("8D", 8),("8C", 8),("8S", 8),
("9H", 9),("9D", 9),("9C", 9),("9S", 9),
("10H", 10),("10D", 10),("10C", 10),("10S", 10),
("JH", 11),("JD", 11),("JC", 11),("JS", 11),
("QH", 12),("QD", 12),("QC", 12),("QS", 12),
("KH", 13),("KD", 13),("KC", 13),("KS", 13);

INSERT INTO blackjack_values (card_id, card_value)
VALUES 
("AH", 11),("AD", 11),("AC", 11),("AS", 11),
("AH", 1),("AD", 1),("AC", 1),("AS", 1),
("2H", 2),("2D", 2),("2C", 2),("2S", 2),
("3H", 3),("3D", 3),("3C", 3),("3S", 3),
("4H", 4),("4D", 4),("4C", 4),("4S", 4),
("5H", 5),("5D", 5),("5C", 5),("5S", 5),
("6H", 6),("6D", 6),("6C", 6),("6S", 6),
("7H", 7),("7D", 7),("7C", 7),("7S", 7),
("8H", 8),("8D", 8),("8C", 8),("8S", 8),
("9H", 9),("9D", 9),("9C", 9),("9S", 9),
("10H", 10),("10D", 10),("10C", 10),("10S", 10),
("JH", 11),("JD", 11),("JC", 11),("JS", 11),
("QH", 12),("QD", 12),("QC", 12),("QS", 12),
("KH", 13),("KD", 13),("KC", 13),("KS", 13);


-- Assignment 3: Storing and Retrieving poker hands--  


CREATE TABLE users
(
    user_id   INT          NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (user_id)
);

INSERT INTO users (user_name)
VALUES ("Louis"),
       ("Jane"),
       ("George"),
       ("Herry"),
       ("Michael");

CREATE TABLE games
(
    game_id   INT          NOT NULL AUTO_INCREMENT,
    game_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (game_id)
);

INSERT INTO games (game_name)
VALUES ("Round 1"),
       ("Round 2"),
       ("Round 3"),
       ("Round 4"),
       ("Round 5"),
       ("Round 6"),
       ("Round 7"),
       ("Round 8");

CREATE TABLE poker_hands
(
    hand_id INT AUTO_INCREMENT NOT NULL,
    user_id INT        NOT NULL,
    game_id INT        NOT NULL,
    card_id VARCHAR(3) NOT NULL,
    PRIMARY KEY (hand_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES standard_deck (card_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games (game_id) ON DELETE CASCADE
);

INSERT INTO poker_hands (user_id, game_id, card_id)
VALUES

-- round 1 
(1, 1, '2H'),(2, 1, '3H'),(3, 1, '4H'),(4, 1, '5H'),
(1, 1, '6H'),(2, 1, '7H'),(3, 1, '8H'),(4, 1, '9H'),
(1, 1, '10H'),(2, 1, 'JH'),(3, 1, 'QH'),(4, 1, 'KH'),
(1, 1, 'AS'),(2, 1, '2S'),(3, 1, '3S'),(4, 1, '4S'),
(1, 1, '5S'),(2, 1, '6S'),(3, 1, '7S'),(4, 1, '8S'),

-- round 2 Four of a hand 
(1, 2, '2H'),(2, 2, '3H'),(3, 2, '4H'),(4, 2, '5H'),
(1, 2, '2S'),(2, 2, '3S'),(3, 2, '4S'),(4, 2, '5S'),
(1, 2, '2D'),(2, 2, '3D'),(3, 2, '4D'),(4, 2, '5D'),
(1, 2, '2C'),(2, 2, '3C'),(3, 2, '4C'),(4, 2, '5C'),
(1, 2, '7D'),(2, 2, '6S'),(3, 2, '7S'),(4, 2, '8S'),

-- Round 3 STRAIGHT FLUSHES
(1, 3, '10H'),(2, 3, '10D'),(3, 3, '10S'),(4, 3, '10C'),
(1, 3, 'JH'),(2, 3, 'JD'),(3, 3, 'JS'),(4, 3, 'JC'),
(1, 3, 'QH'),(2, 3, 'QD'),(3, 3, 'QS'),(4, 3, 'QC'),
(1, 3, 'KH'),(2, 3, 'KD'),(3, 3, 'KS'),(4, 3, 'KC'),
(1, 3, 'AH'),(2, 3, 'AD'),(3, 3, 'AS'),(4, 3, 'AC'),

-- Round 4  Three of a hand 
(1, 4, 'AH'),(2, 4, 'JH'),(3, 4, 'QS'),(4, 4, 'KH'),
(1, 4, 'AS'),(2, 4, 'JD'),(3, 4, 'QD'),(4, 4, 'KC'),
(1, 4, 'AC'),(2, 4, 'JC'),(3, 4, 'QH'),(4, 4, 'KD'),
(1, 4, 'JH'),(2, 4, '2D'),(3, 4, '3D'),(4, 4, '4H'),
(1, 4, '9S'),(2, 4, '3S'),(3, 4, '4S'),(4, 4, '5D'),

-- Round 5 
(1, 5, 'KS'),(2, 5, 'QS'),(3, 5, 'JS'),(4, 5, '10S'),
(1, 5, '9S'),(2, 5, '8S'),(3, 5, '7S'),(4, 5, '6S'),
(1, 5, '5S'),(2, 5, '4S'),(3, 5, '3S'),(4, 5, '2S'),
(1, 5, 'AH'),(2, 5, '3H'),(3, 5, '6H'),(4, 5, '9H'),
(1, 5, '2D'),(2, 5, '5D'),(3, 5, '8D'),(4, 5, '8C'),

-- Round 6 Full House 
(1, 6, '2H'),(2, 6, '3H'),(3, 6, '4H'),(4, 6, '5H'),
(1, 6, '2C'),(2, 6, '3S'),(3, 6, '4S'),(4, 6, '5D'),
(1, 6, '2D'),(2, 6, '3D'),(3, 6, '4D'),(4, 6, '5S'),
(1, 6, 'AS'),(2, 6, 'KS'),(3, 6, 'JS'),(4, 6, '7S'),
(1, 6, 'AH'),(2, 6, 'KH'),(3, 6, 'JD'),(4, 6, '7D'), 

-- Round 7  Two-Pair Hands 
(1, 7, '2H'),(2, 7, '3H'),(3, 7, '4H'),(4, 7, '5H'),
(1, 7, '2C'),(2, 7, '3S'),(3, 7, '4S'),(4, 7, '5D'),
(1, 7, '6D'),(2, 7, '7D'),(3, 7, '8D'),(4, 7, '9S'),
(1, 7, 'AS'),(2, 7, 'KS'),(3, 7, 'JS'),(4, 7, '7S'),
(1, 7, 'AH'),(2, 7, 'KH'),(3, 7, 'JD'),(4, 7, '7D'), 

-- Round 8  Straight Hands
(1, 8, '10H'),(2, 8, '6D'),(3, 8, '10S'),(4, 8, '5C'),
(1, 8, 'JS'),(2, 8, '7D'),(3, 8, 'JD'),(4, 8, '4H'),
(1, 8, 'QD'),(2, 8, '8S'),(3, 8, 'QH'),(4, 8, '3C'),
(1, 8, 'KC'),(2, 8, '9H'),(3, 8, 'KS'),(4, 8, '2D'),
(1, 8, 'AH'),(2, 8, '10D'),(3, 8, 'AS'),(4,8, 'AC');


-- Assignment 4: Sorting hands, then classifying hands

-- Create VIEW 

CREATE VIEW ordered_hands AS
SELECT h1.game_id,
       h1.user_id,
       s1.card_id AS card_id1,
       s2.card_id AS card_id2,
       s3.card_id AS card_id3,
       s4.card_id AS card_id4,
       s5.card_id AS card_id5
FROM poker_hands h1,
     poker_hands h2,
     poker_hands h3,
     poker_hands h4,
     poker_hands h5,
     standard_deck s1,
     standard_deck s2,
     standard_deck s3,
     standard_deck s4,
     standard_deck s5,
     poker_values v1,
     poker_values v2,
     poker_values v3,
     poker_values v4,
     poker_values v5
WHERE
  --  join table
    h1.card_id = s1.card_id
  AND h2.card_id = s2.card_id
  AND h3.card_id = s3.card_id
  AND h4.card_id = s4.card_id
  AND h5.card_id = s5.card_id
  AND h1.card_id = v1.card_id
  AND h2.card_id = v2.card_id
  AND h3.card_id = v3.card_id
  AND h4.card_id = v4.card_id
  AND h5.card_id = v5.card_id
  AND h1.game_id = h2.game_id
  AND h1.game_id = h3.game_id
  AND h1.game_id = h4.game_id
  AND h1.game_id = h5.game_id
  AND h1.user_id = h2.user_id
  AND h1.user_id = h3.user_id
  AND h1.user_id = h4.user_id
  AND h1.user_id = h5.user_id
  --  2. remove duplicates 
  AND (v1.card_value < v2.card_value OR (v1.card_value = v2.card_value AND s1.suit < s2.suit))
  AND (v2.card_value < v3.card_value OR (v2.card_value = v3.card_value AND s2.suit < s3.suit))
  AND (v3.card_value < v4.card_value OR (v3.card_value = v4.card_value AND s3.suit < s4.suit))
  AND (v4.card_value < v5.card_value OR (v4.card_value = v5.card_value AND s4.suit < s5.suit));
  
SELECT * FROM ordered_hands;

-- Q1: Retrieve all full houses using the ordered_hands view.

SELECT game_id,
       user_id,
       oh.card_id1,
       oh.card_id2,
       oh.card_id3,
       oh.card_id4,
       oh.card_id5
FROM ordered_hands oh,
     standard_deck s1,
     standard_deck s2,
     standard_deck s3,
     standard_deck s4,
     standard_deck s5
WHERE
  -- join table
    oh.card_id1 = s1.card_id
  AND oh.card_id2 = s2.card_id
  AND oh.card_id3 = s3.card_id
  AND oh.card_id4 = s4.card_id
  AND oh.card_id5 = s5.card_id
  -- full houses
  AND ((s1.card_rank = s2.card_rank AND s2.card_rank= s3.card_rank AND s4.card_rank = s5.card_rank)
    OR (s1.card_rank = s2.card_rank AND s3.card_rank = s4.card_rank AND s4.card_rank = s5.card_rank));

-- Q2: Retrieve all two-pair hands using the ordered_hands view.
SELECT game_id,
       user_id,
       oh.card_id1,
       oh.card_id2,
       oh.card_id3,
       oh.card_id4,
       oh.card_id5
FROM ordered_hands oh,
     standard_deck s1,
     standard_deck s2,
     standard_deck s3,
     standard_deck s4,
     standard_deck s5
WHERE
  -- join table
    oh.card_id1 = s1.card_id
  AND oh.card_id2 = s2.card_id
  AND oh.card_id3 = s3.card_id
  AND oh.card_id4 = s4.card_id
  AND oh.card_id5 = s5.card_id
  -- two-pair hands
  AND ((s1.card_rank = s2.card_rank AND s2.card_rank <> s3.card_rank AND s3.card_rank = s4.card_rank AND s4.card_rank <> s5.card_rank)
    OR (s1.card_rank = s2.card_rank AND s4.card_rank = s5.card_rank AND s3.card_rank <> s1.card_rank AND
        s3.card_rank <> s4.card_rank)
    OR (s2.card_rank = s3.card_rank AND s3.card_rank <> s4.card_rank AND s4.card_rank = s5.card_rank AND s1.card_rank <> s2.card_rank AND
        s1.card_rank <> s5.card_rank)
    );


-- Q3. Retrieve all straight hands from the ordered_hands view.
SELECT game_id,
       user_id,
       oh.card_id1,
       oh.card_id2,
       oh.card_id3,
       oh.card_id4,
       oh.card_id5
FROM ordered_hands oh,
     standard_deck s1,
     standard_deck s2,
     standard_deck s3,
     standard_deck s4,
     standard_deck s5
WHERE
  --  join table
  oh.card_id1 = s1.card_id
  AND oh.card_id2 = s2.card_id
  AND oh.card_id3 = s3.card_id
  AND oh.card_id4 = s4.card_id
  AND oh.card_id5 = s5.card_id
  -- straight
  AND (
        (s5.card_rank = s4.card_rank + 1
            AND s4.card_rank = s3.card_rank + 1
            AND s3.card_rank = s2.card_rank + 1
            AND s2.card_rank = s1.card_rank + 1)
		-- 2,3,4,5,A
        OR
         (s5.card_rank = 1 AND s1.card_rank = 2 AND s1.card_rank = s2.card_rank -1 AND s2.card_rank = s3.card_rank -1 AND s3.card_rank = s4.card_rank -1)
		-- 10,J,Q,K,A
        OR
         (s5.card_rank = 1 AND s4.card_rank = 13 AND s1.card_rank = s2.card_rank -1 AND s2.card_rank = s3.card_rank -1 AND s3.card_rank = s4.card_rank -1)
    )
  -- create role remove STRAIGHT FLUSHES
   AND NOT (s1.suit = s2.suit AND s2.suit = s3.suit AND s3.suit = s4.suit AND s4.suit = s5.suit);