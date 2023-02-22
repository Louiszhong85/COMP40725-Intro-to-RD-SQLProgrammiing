create database cards;
use cards;
create table standard_deck(
id varchar(50) PRIMARY KEY UNIQUE NOT NULL ,
position int NOT NULL,
suit varchar(50) NOT NULL,
card_rank int NOT NULL, 
card_type varchar(50)NOT NULL);

create table poker_values (
card_id varchar (50) PRIMARY KEY NOT NULL,
card_value int NOT NULL,
foreign key (card_id) references standard_deck(id)); 

INSERT INTO standard_deck (id, position, suit, card_rank, card_type) VALUES
("AH",1,"Hearts",1,"Number"),("AD",2,"Diamonds",1,"Number"),("AC",3,"Clubs",1,"Number"),("AS",4,"Spades",1,"Number"),
("2H",5,"Hearts",2,"Number"),("2D",6,"Diamonds",2,"Number"),("2C",7,"Clubs",2,"Number"),("2S",8,"Spades",2,"Number"),
("3H",9,"Hearts",3,"Number"),("3D",10,"Diamond",3,"Number"),("3C",11,"Clubs",3,"Number"),("3S",12,"Spades",3,"Number"),
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

select * from standard_deck; 
select * from poker_values; 
