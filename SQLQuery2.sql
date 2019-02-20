
 How many copies of the book titled "The Lost Tribe" 
-are owned by the library branch whose name is "Sharpstown"?

CREATE PROCEDURE one @Qone VARCHAR(10)=NULL, @Qtwo VARCHAR(10)=NULL
AS
SELECT BOOKS.Title,LIBRARY_BRANCH.BranchName,Book_copies.Number_Of_Copies
From  BOOK_COPIES inner join BOOKS on BOOK_COPIES.BookID = Books.BookID
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.branchID=book_copies.branchID 
Where books.Title = 'The Lost Tribe' and LIBRARY_BRANCH.BranchName= 'Sharpstow'

CREATE PROCEDURE one @Qone VARCHAR(20)=NULL, @Qtwo VARCHAR(10)=NULL
AS
SELECT BOOKS.Title,LIBRARY_BRANCH.BranchName,Book_copies.Number_Of_Copies
From  BOOK_COPIES inner join BOOKS on BOOK_COPIES.BookID = Books.BookID
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.branchID=book_copies.branchID 
Where books.Title = @Qone and LIBRARY_BRANCH.BranchName= @Qtwo 

exec one @Qone= 'The Lost Tribe', @Qtwo='Sharpstow'

2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

CREATE PROCEDURE two @Q2 VARCHAR(20)
AS 
SELECT books.title,LIBRARY_BRANCH.branchName,book_copies.number_of_copies
From books Inner join Book_copies on books.bookid=book_copies.bookid
inner join library_Branch on library_Branch.branchid=book_copies.branchid 
where books.title = @Q2

exec two @Q2= 'The Lost Tribe'

3.) Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROCEDURE Three
AS 
SELECT borrower.Name
From borrower 
where not exists( 
	select null
	From book_loans
	where book_loans.cardNo = borrower.cardNo
);

4.) For each book that is loaned out from the "Sharpstown" branch and
 whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

CREATE PROCEDURE Four @Q4 VARCHAR(50)=NULL, @Q4_ VARCHAR(30)=NULL
AS 
SELECT library_branch.branchname, Books.title,book_loans.datedue,borrower.name, borrower.address
From books inner join book_loans on books.bookid= book_loans.bookid
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.branchID= book_loans.branchID
inner join borrower on borrower.cardno= book_loans.CardNo
where library_branch.branchname= @Q4
and book_loans.datedue= @Q4_

exec Four @Q4= 'Sharpstow', @Q4_='2019-03-28'


5.) For each library branch, retrieve the branch name and 
the total number of books loaned out from that branch.


SELECT LIBRARY_BRANCH.Branchname,count(book_loans.cardno)as Loanedout
From book_loans inner join LIBRARY_BRANCH on library_branch.branchid= book_loans.branchid
group by LIBRARY_BRANCH.branchname


6.) Retrieve the names, addresses,
 and the number of books checked out for all borrowers
  who have more than five books checked out.

  SELECT count(book_loans.cardno)as Book_Checkout,borrower.name, borrower.address
  FROM borrower inner join book_loans on book_loans.cardno = borrower.cardno
  Group by borrower.name,borrower.address
  having count(book_loans.cardno) => 5


7.) For each book authored 
 by "Stephen King", retrieve the title and the number of copies owned 
 by the library branch whose name is "Central".
 
 create procedure seven @Q7 VARCHAR(20) ,@Q71 VARCHAR(20)
 AS
 select books.title,BOOK_AUTHORS.AUTHORNAME, library_branch.branchName, book_copies.Number_Of_Copies
 from books inner join book_copies on books.bookid=book_copies.bookid
 inner join LIBRARY_BRANCH on LIBRARY_BRANCH.branchid= book_COPIES.branchid 
 inner join BOOK_AUTHORS on BOOK_AUTHORS.bookid= books.bookid
 where BOOK_AUTHORS.authorname=@Q7
 AND LIBRARY_BRANCH.BRANCHNAME=@Q71

 exec SEVEN @Q7= 'Stephen King', @Q71='CENTRAL'


