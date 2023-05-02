USE tours

GO
CREATE INDEX concert_Index 
ON Concert(tour_name, date_of_show);

GO

CREATE INDEX artist_Index 
ON Artist(artist_name);

GO

CREATE INDEX venue_Index
ON Venue(city, state);

GO

CREATE INDEX ticket_Index
ON Tickets(concert_id, section);

GO

CREATE INDEX merch_Index 
ON Merchandise(concert_id, item_name);

GO

CREATE INDEX song_Index
ON Song(artist_id, song_name);

GO

CREATE INDEX user_Index
ON Users(username);

GO
