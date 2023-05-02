USE tours

GO
ALTER TABLE Song
ADD CONSTRAINT unique_songnames
UNIQUE(song_name)

GO