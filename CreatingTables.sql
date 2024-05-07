
CREATE TABLE Category (
    Id      INT IDENTITY(1,1) PRIMARY KEY,
    Name    VARCHAR(50)
)

CREATE TABLE UserEmail (
    Email VARCHAR(100) NOT NULL PRIMARY KEY,
    CategoryId   INT NOT NULL,
    CONSTRAINT FK_CATEGORY FOREIGN KEY (CategoryId)
    REFERENCES Category(Id)
)

CREATE TABLE Ticket(
    Id      INT IDENTITY(1,1) PRIMARY KEY,
    Title   VARCHAR(200) NOT NULL,
    Description VARCHAR(MAX) NOT NULL,
    Priority    VARCHAR(50) NOT NULL,
    State       VARCHAR(50) NOT NULL,
    AssignedTo   VARCHAR(100) NOT NULL,
    CreationUser   VARCHAR(100) NOT NULL,
    DateCreation DATETIME NOT NULL,
    HoursOfSolution INT NOT NULL DEFAULT 0,
    CategoryId   INT NOT NULL,
    DevopsId    INT NOT NULL,
    CONSTRAINT FK_CATEGORY_TICKET FOREIGN KEY (CategoryId)
    REFERENCES Category(Id),
    CONSTRAINT FK_ASSIGNEDTO FOREIGN KEY (AssignedTo)
    REFERENCES UserEmail(Email)
);