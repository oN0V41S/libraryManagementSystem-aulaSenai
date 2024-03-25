/* Deleta tabela caso exista */
drop database if exists library;
/* Instrução para criar banco de dados */
create database library;

/* Ativando banco */
use library;

/* Criando tabela de Editoras */
CREATE TABLE tbl_publisher (
	publisher_PublisherName VARCHAR(100) PRIMARY KEY,
	publisher_PublisherAddress VARCHAR(100) NOT NULL ,
	publisher_PublisherPhone VARCHAR(15) NOT NULL
);

/* Criando tabela de Livros */
CREATE TABLE tbl_book(
	book_BookID INT PRIMARY KEY AUTO_INCREMENT,
	book_Title VARCHAR(100) NOT NULL,
	book_PublisherName VARCHAR(100) NOT NULL
);

/* Tabela de Filiais da Biblioteca */
CREATE TABLE tbl_library_branch(
	library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT,
	library_branch_BranchName VARCHAR(100) NOT NULL ,
	library_branch_BranchAddress VARCHAR(100) NOT NULL,
		library_branch_Phone VARCHAR(15) NOT NULL DEFAULT ""
);

/* Dados dos tomadores de Empréstimos */
CREATE TABLE tbl_borrower(
	borrower_CardNo INT(15) PRIMARY KEY DEFAULT 0,
	borrower_BorrowerName VARCHAR(100) NOT NULL unique,
	borrower_BorrowerAddress VARCHAR(100) NOT NULL 
);

/* Empréstimos de Livros pelos tomadores */
CREATE TABLE tbl_book_loans(
	book_loans_LoansID INT PRIMARY KEY AUTO_INCREMENT,
	book_loans_BookID INT NOT NULL,
	book_loans_BranchID INT NOT NULL,
	book_loans_CardNo INT NOT NULL,
	book_loans_DateOut DATE NOT NULL,
	book_loans_DueDate DATE NOT NULL,

	/* Chave estrangeira para Id Do livro */
	FOREIGN KEY (book_loans_BookID) references tbl_book(book_BookID),
	/* Chave estrangeira para Id Da Filial */
	FOREIGN KEY (book_loans_BranchID) references tbl_library_branch(library_branch_BranchID),
	/* Chave estrangeira para número do cartão do tomador */
	FOREIGN KEY (book_loans_CardNo) references tbl_borrower(borrower_CardNo)
);

/* Tabela de cópias de livros disponíveis na filial */
CREATE TABLE tbl_book_copies(
	book_copies_CopiesID INT PRIMARY KEY,
	book_copies_BookID INT NOT NULL,
	book_copies_BranchID INT NOT NULL,
	book_copies_No_Of_Copies SMALLINT NOT NULL,

	/* Chave estrangeira para Id Do livro */
	FOREIGN KEY (book_copies_BookID) references tbl_book(book_BookID),
	/* Chave estrangeira para Id Da Filial */
	FOREIGN KEY (book_copies_BranchID) references tbl_library_branch(library_branch_BranchID)
);

/* Tabela de Autores */
CREATE TABLE tbl_book_authors(
	book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT,
	book_authors_BookID INT NOT NULL,
	book_authors_AuthorName VARCHAR(100) NOT NULL,

		/* Chave estrangeira para Id Do livro */
	FOREIGN KEY (book_authors_BookID) references tbl_book(book_BookID)
);