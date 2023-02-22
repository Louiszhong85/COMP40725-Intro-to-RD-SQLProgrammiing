DROP DATABASE IF EXISTS Cards; 

CREATE DATABASE  Cards;
USE Cards;

CREATE TABLE standard_deck(
card_id varchar(50) PRIMARY KEY UNIQUE NOT NULL ,
position int NOT NULL,
suit varchar(50) NOT NULL,
card_rank int NOT NULL, 
card_type varchar(50)NOT NULL);

CREATE TABLE poker_values (
card_id varchar (50) PRIMARY KEY NOT NULL,
card_value int NOT NULL,
foreign key (card_id) references standard_deck(card_id)); 

CREATE TABLE blackjack_values (
card_id varchar (50) NOT NULL,
card_value int  NOT NULL,
primary key (card_id,card_value),
foreign key (card_id) references standard_deck(card_id)); 

INSERT INTO standard_deck (card_id, position, suit, card_rank, card_type) VALUES
("AH",1,"Hearts",1,"Number"),("AD",2,"Diamonds",1,"Number"),("AC",3,"Clubs",1,"Number"),("AS",4,"Spades",1,"Number"),
("2H",5,"Hearts",2,"Number"),("2D",6,"Diamonds",2,"Number"),("2C",7,"Clubs",2,"Number"),("2S",8,"Spades",2,"Number"),
("3H",9,"Hearts",3,"Number"),("3D",10,"Diamonds",3,"Number"),("3C",11,"Clubs",3,"Number"),("3S",12,"Spades",3,"Number"),
("4H",13,"Hearts",4,"Number"),("4D",14,"Diamonds",4,"Number"),("4C",15,"Clubs",4,"Number"),("4S",16,"Spades",4,"Number"),
("5H",17,"Hearts",5,"Number"),("5D",18,"Diamonds",5,"Number"),("5C",19,"Clubs",5,"Number"),("5S",20,"Spades",5,"Number"),
("6H",21,"Hearts",6,"Number"),("6D",22,"Diamonds",6,"Number"),("6C",23,"Clubs",6,"Number"),("6S",24,"Spades",6,"Number"),
("7H",25,"Hearts",7,"Number"),("7D",26,"Diamonds",7,"Number"),("7C",27,"Clubs",7,"Number"),("7S",28,"Spades",7,"Number"),
("8H",29,"Hearts",8,"Number"),("8D",30,"Diamonds",8,"Number"),("8C",31,"Clubs",8,"Number"),("8S",32,"Spades",8,"Number"),
("9H",33,"Hearts",9,"Number"),("9D",34,"Diamonds",9,"Number"),("9C",35,"Clubs",9,"Number"),("9S",36,"Spades",9,"Number"),
("10H",37,"Hearts",10,"Number"),("10D",38,"Diamonds",10,"Number"),("10C",39,"Clubs",10,"Number"),("10S",40,"Spades",10,"Number"),
("JH",41,"Hearts",11,"Face"),("JD",42,"Diamonds",11,"Face"),("JC",43,"Clubs",11,"Face"),("JS",44,"Spades",11,"Face"),
("QH",45,"Hearts",12,"Face"),("QD",46,"Diamonds",12,"Face"),("QC",47,"Clubs",12,"Face"),("QS",48,"Spades",12,"Face"),
("KH",49,"Hearts",13,"Face"),("KD",50,"Diamonds",13,"Face"),("KC",51,"Clubs",13,"Face"),("KS",52,"Spades",13,"Face");

INSERT INTO poker_values (card_id,card_value) VALUES
("AH",14),("AD",14),("AC",14),("AS",14),
("2H",2),("2D",2),("2C",2),("2S",2),
("3H",3),("3D",3),("3C",3),("3S",3),
("4H",4),("4D",4),("4C",4),("4S",4),
("5H",5),("5D",5),("5C",5),("5S",5),
("6H",6),("6D",6),("6C",6),("6S",6),
("7H",7),("7D",7),("7C",7),("7S",7),
("8H",8),("8D",8),("8C",8),("8S",8),
("9H",9),("9D",9),("9C",9),("9S",9),
("10H",10),("10D",10),("10C",10),("10S",10),
("JH",11),("JD",11),("JC",11),("JS",11),
("QH",12),("QD",12),("QC",12),("QS",12),
("KH",13),("KD",13),("KC",13),("KS",13);

INSERT INTO blackjack_values (card_id,card_value) VALUES
("AH",11),("AD",11),("AC",11),("AS",11),
("AH",1),("AD",1),("AC",1),("AS",1),
("2H",2),("2D",2),("2C",2),("2S",2),
("3H",3),("3D",3),("3C",3),("3S",3),
("4H",4),("4D",4),("4C",4),("4S",4),
("5H",5),("5D",5),("5C",5),("5S",5),
("6H",6),("6D",6),("6C",6),("6S",6),
("7H",7),("7D",7),("7C",7),("7S",7),
("8H",8),("8D",8),("8C",8),("8S",8),
("9H",9),("9D",9),("9C",9),("9S",9),
("10H",10),("10D",10),("10C",10),("10S",10),
("JH",11),("JD",11),("JC",11),("JS",11),
("QH",12),("QD",12),("QC",12),("QS",12),
("KH",13),("KD",13),("KC",13),("KS",13);


-- Assignment 3: Storing and Retrieving poker hands--  


CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (user_id)
);

INSERT INTO users (user_name)
VALUES 
  ("Louis"),
  ("Jane"),
  ("George"),
  ("Herry"),
  ("Michael");

CREATE TABLE games (
  game_id INT NOT NULL AUTO_INCREMENT,
  game_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (game_id)
  );

INSERT INTO games (game_name)
VALUES 
  ("Round 1"),
  ("Round 2"),
  ("Round 3"),
  ("Round 4"),
	("Round 5");

CREATE TABLE poker_hands (
  hand_id INT AUTO_INCREMENT NOT NULL,
  user_id INT NOT NULL,
  game_id INT NOT NULL,
  card_id VARCHAR(3) NOT NULL,
  PRIMARY KEY (hand_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (card_id) REFERENCES standard_deck (card_id),
  FOREIGN KEY (game_id) REFERENCES games (game_id)
);

INSERT INTO poker_hands (user_id, game_id, card_id) 
VALUES 

-- round 1 
(1,1,'2H'), (2,1,'3H'), (3,1,'4H'), (4,1,'5H'),
(1,1,'7H'), (2,1,'6H'), (3,1,'8H'), (4,1,'9H'),
(1,1,'10H'), (2,1,'JH'), (3,1,'KH'), (4,1,'QH'),
(1,1,'AS'), (2,1,'3S'), (3,1,'6S'), (4,1,'7S'), 
(1,1,'9S'), (2,1,'JS'), (3,1,'6D'), (4,1,'7D'),  

-- round 2 Four of a hand 
(1,2,'2H'), (2,2,'3H'), (3,2,'4H'), (4,2,'5H'),
(1,2,'2S'), (2,2,'3S'), (3,2,'4S'), (4,2,'5S'),
(1,2,'2D'), (2,2,'3D'), (3,2,'4D'), (4,2,'5D'),
(1,2,'2C'), (2,2,'3C'), (3,2,'4C'), (4,2,'5C'), 
(1,2,'9S'), (2,2,'JS'), (3,2,'6D'), (4,2,'7D'),  

-- Round 3 STRAIGHT FLUSHES
(1,3,'10H'), (2,3,'10D'), (3,3,'10S'), (4,3,'10C'),
(1,3,'JH'), (2,3,'JD'), (3,3,'JS'), (4,3,'JC'),
(1,3,'QH'), (2,3,'QD'), (3,3,'QS'), (4,3,'QC'),
(1,3,'KH'), (2,3,'KD'), (3,3,'KS'), (4,3,'KC'), 
(1,3,'AH'), (2,3,'AD'), (3,3,'AS'), (4,3,'AC'), 

-- Round 4  Three of a hand 
(1,4,'AH'), (2,4,'JH'), (3,4,'QS'), (4,4,'KH'),
(1,4,'AS'), (2,4,'JD'), (3,4,'QD'), (4,4,'KC'),
(1,4,'AC'), (2,4,'JC'), (3,4,'QH'), (4,4,'KD'),
(1,4,'JH'), (2,4,'2D'), (3,4,'3D'), (4,4,'4S'), 
(1,4,'9S'), (2,4,'2S'), (3,4,'3S'), (4,4,'9D'), 

-- Round 5 
(1,5,'AH'), (2,5,'JH'), (3,5,'QS'), (4,5,'KH'),
(1,5,'2S'), (2,5,'2D'), (3,5,'2D'), (4,5,'2C'),
(1,5,'AC'), (2,5,'JC'), (3,5,'QH'), (4,5,'KD'),
(1,5,'5D'), (2,5,'5S'), (3,5,'5C'), (4,5,'5S'), 
(1,5,'JS'), (2,5,'7S'), (3,5,'3S'), (4,5,'4D');

-- Q1.  Write an SQL query to retrieve all FOUR-OF-A-KIND hands from the poker_hands table. Ensure that each hand is retrieved at most once.

SELECT DISTINCT 
R1.user_id, R1.game_id, R1.card_id, R2.card_id, R3.card_id, R4.card_id, R5.card_id
FROM
poker_hands R1, poker_hands R2, poker_hands R3, poker_hands R4, poker_hands R5,
standard_deck s1, standard_deck s2, standard_deck s3, standard_deck s4, standard_deck s5  
-- Self join the TABLE
WHERE
R1.card_id = s1.card_id AND R2.card_id = s2.card_id AND R3.card_id = s3.card_id AND R4.card_id = s4.card_id AND R5.card_id = s5.card_id AND
R1.user_id = R2.user_id AND R1.user_id = R3.user_id AND R1.user_id = R4.user_id AND R1.user_id = R5.user_id AND 
R1.game_id = R2.game_id AND R1.game_id = R3.game_id AND R1.game_id = R4.game_id AND R1.game_id = R5.game_id AND 
--  FOUR-OF-A-KIND
--  First 4 card same of rank 
s1.card_rank = s2.card_rank AND s2.card_rank = s3.card_rank AND s3.card_rank = s4.card_rank AND 
--  Definition rul to remove duplicates result
s1.suit = "Hearts" AND s2.suit = "Diamonds" AND s3.suit = "Clubs" AND S4.suit = "Spades" AND 
-- will last card inconsisten previous card     
s4.card_rank <> s5.card_rank; 

-- Q2.  Write an SQL query to retrieve all THREE-OF-A-KIND hands from the poker_hands table. Ensure that each hand is retrieved at most once, and that this query does not retrieve any FOUR-OF-A-KIND hands.
 
SELECT DISTINCT 
R1.user_id, R1.game_id, R1.card_id, R2.card_id, R3.card_id, R4.card_id, R5.card_id
FROM
poker_hands R1, poker_hands R2, poker_hands R3, poker_hands R4, poker_hands R5,
standard_deck s1, standard_deck s2, standard_deck s3, standard_deck s4, standard_deck s5  
-- Self join the TABLE
WHERE
R1.card_id = s1.card_id AND R2.card_id = s2.card_id AND R3.card_id = s3.card_id AND R4.card_id = s4.card_id AND R5.card_id = s5.card_id AND
R1.user_id = R2.user_id AND R1.user_id = R3.user_id AND R1.user_id = R4.user_id AND R1.user_id = R5.user_id AND 
R1.game_id = R2.game_id AND R1.game_id = R3.game_id AND R1.game_id = R4.game_id AND R1.game_id = R5.game_id AND
--  FOUR-OF-A-KIND
--  First 4 card same of rank 
s1.card_rank = s2.card_rank AND s2.card_rank = s3.card_rank AND 
--  Definition rule to remove duplicates result
s1.suit < s2.suit AND s2.suit < s3.suit AND
-- will last two card inconsisten previous card  
s3.card_rank <> s4.card_rank AND s3.card_rank <> s5.card_rank AND 
-- Definition rule regard to situation one card 4 <> card 5. situation two card 4 == card 5
(s4.card_rank < s5.card_rank OR( s4.card_rank = s5.card_rank AND s4.suit < s5.suit));


-- Q3. Write an SQL query to retrieve all STRAIGHT FLUSHES from the poker_hands table. A straight flush is a hand of five cards in which the cards are in strict numeric sequence (e.g. 2,3,4,5,6 or 10, J, Q, K, A) and all have the same suit (e.g., 9H, 10H, JH, QH, KH). Once again, ensure that each hand is retrieved at most once.

SELECT DISTINCT 
R1.user_id, R1.game_id, R1.card_id, R2.card_id, R3.card_id, R4.card_id, R5.card_id
FROM
poker_hands R1, poker_hands R2, poker_hands R3, poker_hands R4, poker_hands R5,
standard_deck s1, standard_deck s2, standard_deck s3, standard_deck s4, standard_deck s5,
poker_values v1, poker_values v2, poker_values v3, poker_values v4, poker_values v5  
-- Self join the TABLE
WHERE
R1.card_id = s1.card_id AND R2.card_id = s2.card_id AND R3.card_id = s3.card_id AND R4.card_id = s4.card_id AND R5.card_id = s5.card_id AND
R1.user_id = R2.user_id AND R1.user_id = R3.user_id AND R1.user_id = R4.user_id AND R1.user_id = R5.user_id AND 
R1.game_id = R2.game_id AND R1.game_id = R3.game_id AND R1.game_id = R4.game_id AND R1.game_id = R5.game_id AND
R1.card_id = v1.card_id AND R2.card_id = v2.card_id AND R3.card_id = v3.card_id AND R4.card_id = v4.card_id AND R5.card_id = v5.card_id AND 
-- Definition rule to find STRAIGHT FLUSHES
s1.suit = s2.suit AND s1.suit = s3.suit  AND s1.suit = s4.suit AND s1.suit = s5.suit AND 
v1.card_value = v2.card_value-1 AND v2.card_value = v3.card_value-1 AND v3.card_value = v4.card_value-1 AND v4.card_value = v5.card_value-1; 