
CREATE DATABASE DB_LIBRARY

CREATE TABLE LIBRARY_BRANCH(
BranchID INT not null identity(1111,1),
BranchName varchar(30)not null,
Address varchar(50)not null
);
Insert into LIBRARY_BRANCH
(BranchName, Address)
Values
('Statelibary','3st city,10002'),
('Nationallibary','4st city,10003')


CREATE TABLE BOOK_COPIES(
BookID INT NOT NULL CONSTRAINT fk_bkid FOREIGN KEY REFERENCES BOOKS(BOOKID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_bchid FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
Number_OF_Copies INT NOT NULL
);
INSERT INTO BOOK_COPIES
(BookID,BranchID,Number_OF_Copies)
VALUES
(1001,1112,2),
(1002,1112,2),
(1003,1111,2),
(1004,1112,2),
(1005,1112,2),
(1006,1112,2),
(1007,1112,2),
(1008,1112,2),
(1009,1112,2),
(1010,1112,2),
(1011,1112,2),
(1012,1111,2),
(1013,1111,2),
(1014,1111,2),
(1015,1111,2),
(1016,1111,2),
(1017,1111,2),
(1018,1111,2),
(1019,1111,2),
(1020,1111,2),
(1021,1113,2),
(1022,1113,2),
(1023,1113,2),
(1024,1113,2),
(1025,1113,2),
(1026,1113,2),
(1027,1113,2),
(1028,1113,2),
(1029,1113,2),
(1030,1113,2),
(1031,1114,2),
(1032,1114,2),
(1033,1114,2),
(1034,1114,2),
(1035,1114,2),
(1036,1114,2),
(1037,1114,2),
(1038,1114,2),
(1039,1114,2),
(1040,1114,2)

CREATE TABLE BOOKS(
BOOKID INT PRIMARY KEY NOT NULL IDENTITY(1001,1),
Title VARCHAR(70) NOT NULL,
PublisherName VARCHAR(50)NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO BOOKS
(Title, PublisherName)
VALUES 
('The Stand','Doubleday'),
('Carrie','Doubleday'),
('The Lost Tribe','Henry Holt & Company'),
('A Higher Loyalty','Macmillan '),
('A Wrinkle in Time','Flatiron'),
('Dog Man and Cat Kid','Scholastic'),
('A Day in the Life of Marlon Bundo','Chronicle'),
('12 Rules for Life','Random Canada'),
('Oh, the Places You’ll Go!','Random'),
('The President Is Missing','Little, Brown/Knopf'),
('You Are a Badass','Hachette'),
('The Subtle Art of Not Giving a F*ck','Harper'),
('The Sun and Her Flowers','Andrews McMeel'),
('Wonder','Random'),
('Milk and Honey ','Andrews McMeel'),
('The Outsider','S&S'), 
('Green Eggs','Random'),
('Diary of a Wimpy Kid #12','Abrams'), 
('The Woman in the Window','Morrow'), 
('The Great Alone','St. Martin’s'), 
('Strengths Finder 2.0','Gallup'),
('War and Peace','Random'),
('Song of Solomon','Random'),
('Ulysses','Random'),
('The Shadow of the Wind','Random'),
('The Lord of the Ring','Random'),
('The Santanic Verses','Random'),
('Miguel de Cervantes','Random'),
('The Golden Compass','Random'),
('Catch-22','Random'),
('1984','Random'),
('The Kite Runner','Random'),
('Little Women','Random'),
('The Cloud Atlas','Random'),
('The Fountainhead','Random'),
('The Picture of Dorian Gray','Random'),
('The Adventures of Tom Sawyer','Random'),
('The Grapes of Wrath','Random'),
('Alice Adventures in Wonderland','Random'),
('Anne of Green Gables','Random'),
('The Call of the Wild','Random')

CREATE TABLE BOOK_AUTHORS(
BOOKID INT NOT NULL CONSTRAINT fk_BOOKID FOREIGN KEY REFERENCES BOOKS(BOOKID) ON UPDATE CASCADE ON DELETE CASCADE,
AuthorName VARCHAR(50) NOT NULL
);
INSERT INTO BOOK_AUTHORS
(BOOKID,AuthorName)
VALUES 
(1001,'stephen king'),
(1002,'stephen king'),
(1003,'Edward Marriott'),
(1004,'James Comey'),
(1005,'Madeleine L’Engle'),
(1006,'Dav Pilkey'),
(1007,'Marlon Bundo'),
(1008,'Jordan B. Peterson'),
(1009,'Dr. Seuss'),
(1010,'Bill Clinton and James Patterson'),
(1011,'Jen Sincero'),
(1012,'Mark Manson'),
(1013,'Rupi Kaur'),
(1014,'R.J. Palacio'),
(1015,'Rupi Kaur'),
(1016,'Stephen King'),
(1017,'Dr. Seuss'),
(1018,'Jeff Kinney'),
(1019,'A.J. Finn'),
(1020,'Hannah Kristin'),
(1021,'Tom Rath'),
(1022,'Leo Tolstoy'),
(1023,'Toni Morrison'),
(1024,'James Joyce'),
(1025,'Carlos Ruiz Zafon'),
(1026,'J.R.R Tolkien'),
(1027,'Salman Rushdie'),
(1028,'Don Quixote'),
(1029,'Philip Pullman'),
(1030,'Joseph Heller'),
(1031,'George Orwell'),
(1031,'Khaled Hosseini'),
(1032,'Louisa May Alcott'),
(1033,'David Mitchell'),
(1034,'Ayn Rand'),
(1035,'Oscar Wilde'),
(1036,'Mark Twain'),
(1037,'John Steinbeck'),
(1038,'Lewis Carroll'),
(1039,'L.M Montgomery'),
(1040,'Jack London')


CREATE TABLE BOOK_LOANS(
BookID INT NOT NULL CONSTRAINT fk_bksid FOREIGN KEY REFERENCES BOOKS(BOOKID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_brid FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NOT NULL CONSTRAINT fk_cno FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut DATE NOT NULL,
DateDue DATE NOT NULL 
);

INSERT INTO BOOK_LOANS 
(BookID,BRANCHID,CardNo, DateOut, DateDue)
VALUES
(1001,1112,1221,'2019-01-01','2019-03-31'),
(1002,1112,1221,'2019-01-01','2019-03-31'),
(1003,1111,1225,'2019-01-06','2019-03-26'),
(1004,1112,1221,'2019-01-01','2019-03-31'),
(1005,1112,1221,'2019-01-01','2019-03-31'),
(1006,1112,1221,'2019-01-01','2019-03-31'),
(1007,1112,1240,'2019-01-15','2019-03-15'),
(1008,1112,1240,'2019-01-02','2019-03-30'),
(1009,1112,1240,'2019-01-02','2019-03-30'),
(1010,1112,1223,'2019-01-04','2019-03-28'),
(1011,1112,1224,'2019-01-05','2019-03-27'),
(1012,1111,1222,'2019-01-03','2019-03-29'),
(1013,1111,1222,'2019-01-03','2019-03-29'),
(1014,1111,1222,'2019-01-03','2019-03-29'),
(1015,1111,1222,'2019-01-03','2019-03-29'),
(1016,1111,1222,'2019-01-03','2019-03-29'),
(1017,1111,1223,'2019-01-04','2019-03-28'),
(1018,1111,1224,'2019-01-05','2019-03-27'),
(1019,1111,1225,'2019-01-06','2019-03-26'),
(1020,1111,1226,'2019-01-07','2019-03-25'),
(1021,1113,1227,'2019-01-08','2019-03-24'),
(1022,1113,1228,'2019-01-09','2019-03-23'),
(1023,1113,1229,'2019-01-10','2019-03-22'),
(1024,1113,1230,'2019-01-11','2019-03-21'),
(1025,1113,1231,'2019-01-12','2019-03-20'),
(1026,1113,1232,'2019-01-13','2019-03-21'),
(1027,1113,1233,'2019-01-14','2019-03-22'),
(1028,1113,1234,'2019-01-15','2019-03-21'),
(1029,1113,1234,'2019-01-15','2019-03-21'),
(1030,1113,1235,'2019-01-16','2019-03-20'),
(1031,1114,1235,'2019-01-16','2019-03-20'),
(1032,1114,1236,'2019-01-17','2019-03-19'),
(1033,1114,1236,'2019-01-17','2019-03-19'),
(1034,1114,1237,'2019-01-18','2019-03-18'),
(1035,1114,1237,'2019-01-18','2019-03-18'),
(1036,1114,1238,'2019-01-17','2019-03-17'),
(1037,1114,1238,'2019-01-17','2019-03-17'),
(1038,1114,1239,'2019-01-16','2019-03-16'),
(1039,1114,1239,'2019-01-16','2019-03-16'),
(1040,1114,1240,'2019-01-15','2019-03-15')


CREATE TABLE BORROWER(
CardNo INT PRIMARY KEY NOT NULL IDENTITY(1221, 1),
Name VARCHAR(20)NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(30)NOT NULL
);
INSERT INTO BORROWER
(Name, Address, Phone)
VALUES
('John Smith','526 Dogwood Street Omaha, NE 68107','822-695-7768'),
('Joe Smith','4 Bayberry Avenue Elyria, OH 44035','445-646-7029'),
('Bob Smith','659 Jockey Hollow Street Waterloo, IA 50701','828-898-2802'),
('Mike Smith','533 West Main Avenue Montgomery, AL 36109','349-572-0120'),
('Juan Carlos','425 Van Dyke Dr. Santa Cruz, CA 95060','205-364-8405'),
('Jane Smith','8945 Bear Hill Drive Smyrna, GA 30080','946-808-5462'),
('Mike Jones','9587 Jennings St. Pittsburgh, PA 15206','634-644-2774'),
('David Smith','42 Tailwater Drive Bolingbrook, IL 60440','280-418-8376'),
('Sarah Smith','52 Pendergast Street Independence, KY 41051','433-818-9853'),
('James Smith','19 Lafayette Lane Lumberton, NC 28358','781-600-5830'),
('Albert Einstein','939 W. Riverview Street Westfield, MA 01085','964-404-6847'),
('Blaise Pascal','529 Locust St. Atlantic City, NJ 08401','744-690-7809'),
('Edmond Halley','872 Sulphur Springs Drive Chelmsford, MA 01824','514-394-4244'),
('Enrico Fermi','9153 West Stillwater Court Miamisburg, OH 45342','425-940-3018'),
('Gertrude B. Elion','7439 Miles St. Burlington, MA 01803','440-406-2510'),
('Lise Meitner','94 Middle River Dr. Corona, NY 11368','358-834-9546'),
('Lord Kelvin','7439 Miles St. Burlington, MA 01803','237-212-8971'),
('Maria Mitchell','94 Middle River Dr. Corona, NY 11368','346-445-9480'),
('Marie Curie','7 Ashley Ave. Conway, SC 29526','897-450-9976'),
('Max Born','8590 Galvin St. Williamstown, NJ 08094','518-525-8884'),
('Max Planck','3 Wild Horse Ave. Encino, CA 91316','912-779-0533')
 
CREATE TABLE PUBLISHER(
PublisherName VARCHAR(50)PRIMARY KEY NOT NULL,
Address VARCHAR(70)NOT NULL, 
Phone VARCHAR(40)NOT NULL 
);
INSERT INTO PUBLISHER 
(PublisherName, Address, Phone)
VALUES 
('Doubleday','11 st city,12345','678-987-0478'),
('Henry Holt & Company','77 st city,11111','678-827-7870'),
('Macmillan','333 st city,33333','508-773-1663'),
('Flatiron','444 st city,44444','869-242-8248'),
('Scholastic','555 st city,55555','260-390-8621'),
('Chronicle','666 st city,66666','740-616-3368'),
('Random Canada','777 st city,77777','702-618-5633'),
('Little, Brown/Knopf','999 st city,99999','663-510-7482'),
('Hachette','110 st city,11122','461-839-0607'),
('Harper','123st city 56778','123-765-0987'),
('Andrews McMeel','113 st city 11144','838-505-9208'),
('Random','114 st city 11155','710-753-9589'),
('S&S','116 st city 11177','416-586-4793'), 
('Abrams','118 st city 11199','321-594-1036'), 
('Morrow','119 st city 11110','722-669-2711'),
('St. Martin’s','111 st city 111100','554-890-7298'), 
('Gallup','111 st city 11011','844-339-7603')



