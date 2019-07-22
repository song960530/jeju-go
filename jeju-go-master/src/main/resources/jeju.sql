SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Board;
DROP TABLE IF EXISTS Finally;
DROP TABLE IF EXISTS HReserve;
DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Love;
DROP TABLE IF EXISTS Point;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Package;




/* Create Tables */

CREATE TABLE Board
(
	No int(5) NOT NULL,
	userid varchar(50) NOT NULL,
	subject varchar(100) NOT NULL,
	content varchar(10000) NOT NULL,
	regdate datetime,
	ref int(5),
	reflevel int(5),
	refstep int(5),
	type varchar(10),
	type2 varchar(10),
	PRIMARY KEY (No)
);


CREATE TABLE Finally
(
	no int(5) NOT NULL,
	hno int(5) NOT NULL,
	roomnum varchar(10) NOT NULL,
	pno int(5) NOT NULL,
	type varchar(10),
	total int(20),
	userid varbinary(50),
	repdate varchar(10),
	checked varchar(5),
	regdate datetime,
	point int(10) NOT NULL,
	pnum int(5),
	PRIMARY KEY (no)
);


CREATE TABLE Hotel
(
	no int(5) NOT NULL,
	hname varchar(50) NOT NULL,
	address varchar(200),
	lat varchar(50),
	lng varchar(50),
	content varchar(10000),
	tel varchar(30),
	PRIMARY KEY (no)
);


CREATE TABLE HReserve
(
	no int(10) NOT NULL,
	hno int(5) NOT NULL,
	roomnum varchar(10) NOT NULL,
	name varchar(20),
	mon int(3),
	day int(3),
	subscriber varchar(50),
	PRIMARY KEY (no)
);


CREATE TABLE Love
(
	userid varchar(50) NOT NULL,
	no int(5) NOT NULL,
	type varchar(10) NOT NULL,
	PRIMARY KEY (userid, no, type)
);


CREATE TABLE Member
(
	userid varchar(50) NOT NULL,
	username varchar(10) NOT NULL,
	password varchar(200) NOT NULL,
	phone varchar(30) NOT NULL,
	PRIMARY KEY (userid)
);


CREATE TABLE Package
(
	no int(5) NOT NULL,
	name varchar(50),
	content varchar(10000),
	travelday varchar(10),
	price int(10),
	mon int(4),
	startday varchar(50),
	regdate datetime,
	max int(5),
	photourl varchar(50),
	photoname varchar(50),
	PRIMARY KEY (no)
);


CREATE TABLE photo
(
	no  NOT NULL,
	hno int(5) NOT NULL,
	roomnum varchar(10) NOT NULL,
	photourl varchar(100),
	photoname varchar(100),
	PRIMARY KEY (no)
);


CREATE TABLE Point
(
	userid varchar(50) NOT NULL,
	point int(10),
	regdate datetime,
	type varchar(10)
);


CREATE TABLE Review
(
	hno int(5) NOT NULL,
	roomnum varchar(10) NOT NULL,
	pno int(5) NOT NULL,
	name varchar(50),
	regdate datetime,
	content varchar(10000),
	clpoint int(5),
	lopoint int(5),
	prpoint int(5),
	sepoint int(5)
);


CREATE TABLE Room
(
	hno int(5) NOT NULL,
	roomnum varchar(10) NOT NULL,
	name varchar(20) NOT NULL,
	price int(20),
	convenient varchar(500),
	bed varchar(20),
	bedcount int(5),
	max int(3),
	PRIMARY KEY (hno, roomnum)
);



/* Create Foreign Keys */

ALTER TABLE Room
	ADD FOREIGN KEY (hno)
	REFERENCES Hotel (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Board
	ADD FOREIGN KEY (userid)
	REFERENCES Member (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Love
	ADD FOREIGN KEY (userid)
	REFERENCES Member (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Point
	ADD FOREIGN KEY (userid)
	REFERENCES Member (userid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Finally
	ADD FOREIGN KEY (pno)
	REFERENCES Package (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Review
	ADD FOREIGN KEY (pno)
	REFERENCES Package (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Finally
	ADD FOREIGN KEY (hno, roomnum)
	REFERENCES Room (hno, roomnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE HReserve
	ADD FOREIGN KEY (hno, roomnum)
	REFERENCES Room (hno, roomnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo
	ADD FOREIGN KEY (hno, roomnum)
	REFERENCES Room (hno, roomnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Review
	ADD FOREIGN KEY (hno, roomnum)
	REFERENCES Room (hno, roomnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



