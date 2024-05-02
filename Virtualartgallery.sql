-- Create the Artist table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(20),
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(10),
    Website VARCHAR(20),
    ContactInformation VARCHAR(25)
);

-- Create the Artwork table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(20),
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(20),
    ImageURL VARCHAR(25),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

-- Create the User table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(100,1),
    Username VARCHAR(50),
    Password VARCHAR(10),
    Email VARCHAR(25),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(25)
);

-- Create the Gallery table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY IDENTITY(200,1),
    Name VARCHAR(20),
    Website VARCHAR(20),
    Description TEXT,
    Location VARCHAR(20),
    Curator INT,
    OpeningHours VARCHAR(10),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);

-- Create the User_Favorite_Artwork junction table
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    PRIMARY KEY (UserID, ArtworkID)
);

-- Create the Artwork_Gallery junction table
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID),
    PRIMARY KEY (ArtworkID, GalleryID)
);








