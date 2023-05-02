USE tours

GO

ALTER TABLE Users
ADD CONSTRAINT unique_usernames2
UNIQUE(username)

GO

ALTER TABLE Song
ADD CONSTRAINT unique_song
UNIQUE(artist_id, song_name)
GO