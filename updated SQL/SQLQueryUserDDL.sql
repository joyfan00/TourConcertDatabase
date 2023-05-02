USE tours

CREATE TABLE Users
(
id INT PRIMARY KEY IDENTITY(1,1),
username VARCHAR (40) NOT NULL,
num_tickets_purchased INT DEFAULT 0,
num_merch_purchased INT DEFAULT 0,
balance BIGINT NOT NULL DEFAULT 0
)

CREATE TABLE Venue
(
id INT PRIMARY KEY IDENTITY(1,1),
venue_name VARCHAR (40) NOT NULL,
venue_type VARCHAR (20) NOT NULL,
city VARCHAR (20) NOT NULL,
state VARCHAR(20) NOT NULL,
capacity INT,
CHECK (venue_type IN ('amphitheater', 
'arena', 'club', 'concert hall',
'opera house', 'other', 'stadium', 'theater'))
)

CREATE TABLE Artist
(
id INT PRIMARY KEY IDENTITY(1,1),
artist_name VARCHAR (40) NOT NULL,
genre VARCHAR (20) NOT NULL,
artist_type VARCHAR (20) NOT NULL,
popular_album VARCHAR (20),
popular_song VARCHAR(20),
CHECK (artist_type IN ('solo', 'duo', 
'band/group', 'choir', 'concert band', 'other')),
CHECK (genre IN ('pop', 'country', 'rock',
'hip hop', 'rnb', 'rap', 'indie', 'funk',
'jazz', 'other', 'alternative', 'grunge',
'global', 'dance', 'classical'))
)

CREATE TABLE Song
(
id INT PRIMARY KEY IDENTITY(1,1),
song_name VARCHAR (20) NOT NULL,
album VARCHAR (20),
artist_id INT,
FOREIGN KEY (artist_id) REFERENCES Artist(id) ON DELETE SET NULL
)

CREATE TABLE Concert
(
id INT PRIMARY KEY IDENTITY(1,1),
tour_name VARCHAR (40) NOT NULL,
artist_id INT,
venue_id INT,
time_start TIME,
date_of_show DATE,
FOREIGN KEY (venue_id) REFERENCES Venue(id) ON DELETE CASCADE,
FOREIGN KEY (artist_id) REFERENCES Artist(id) ON DELETE CASCADE,
)

CREATE TABLE Tickets
(
concert_id INT NOT NULL,
section VARCHAR (20) NOT NULL,
price BIGINT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (concert_id, section),
FOREIGN KEY (concert_id) REFERENCES Concert(id) ON DELETE CASCADE,
CHECK (section IN ('VIP', 'General Admission',
'Premium', 'Upper (Seated)', 'Lower (Seated)',
'Other', 'Balcony'))
)

CREATE TABLE Merchandise
(
concert_id INT NOT NULL,
item_name VARCHAR (20) NOT NULL,
category VARCHAR (20) NOT NULL,
price BIGINT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (concert_id, item_name),
FOREIGN KEY (concert_id) REFERENCES Concert(id) ON DELETE CASCADE,
CHECK (category in ('shirt', 'hoodie', 'hat',
'pants', 'keychain', 'poster', 'other clothing',
'other item'))
)