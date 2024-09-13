CREATE TABLE constituencywise_details(
	"S.No" int,
	Candidate varchar(100),
	Party varchar (100),
	"EVM Votes" int,
	"Postal Votes" int,
	"Total Votes" int,
	"% of Votes" float,
	"Constituency ID" varchar (50)
);

DROP TABLE IF EXISTS constituencywise_details; -- to change some details in the column titles

CREATE TABLE constituencywise_details(
	"S.N." int,
	"Candidate" varchar(100),
	"Party" varchar (100),
	"EVM Votes" int,
	"Postal Votes" int,
	"Total Votes" int,
	"% of Votes" float,
	"Constituency ID" varchar (50)
);
	
SELECT * FROM constituencywise_details;

CREATE TABLE constituencywise_results(
	"S.No" int,
	"Parliament Constituency" varchar(50),
	"Constituency Name" varchar(50),
	"Winning Candidate"	varchar(100),
	"Total Votes" int,
	"Margin" int,
	"Constituency ID" varchar(25),	
	"Party ID" int
);

SELECT * FROM constituencywise_results;

DROP TABLE IF EXISTS partywise_results;

CREATE TABLE partywise_results(
	"Party"	varchar(100),
	"Won" int,
	"Party ID" int
);

SELECT * FROM partywise_results;

CREATE TABLE statewise_results(
	"Constituency" varchar(50),
	"Const. No." int,
	"Parliament Constituency" varchar(50),	
	"Leading Candidate" varchar(100),
	"Trailing Candidate" varchar(100),
	"Margin" int,
	"Status" varchar(50),
	"State ID" varchar(10),
	"State" varchar(25)
);

SELECT * FROM statewise_results;

CREATE TABLE states(
	"State ID" varchar(5),
	"State" varchar(50)
);

SELECT * FROM states;
