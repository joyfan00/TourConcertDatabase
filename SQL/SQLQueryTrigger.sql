USE tours

GO 
CREATE TRIGGER addPopularSong2
ON Artist
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @popularSongName VARCHAR(20)
	SELECT @popularSongName = inserted.popular_song FROM inserted

	DECLARE @insertedArtistId INT
	SELECT @insertedArtistId = inserted.id FROM inserted

	BEGIN TRANSACTION

	IF NOT EXISTS (SELECT 1 FROM Song WHERE Song.song_name = @popularSongName AND Song.artist_id = @insertedArtistId)
	BEGIN
		INSERT INTO Song (song_name, artist_id) SELECT @popularSongName, inserted.id FROM inserted

		IF @@ERROR <> 0
		BEGIN
			RAISERROR('Error inserting song into Song table', 16, 1)
			ROLLBACK TRANSACTION
			RETURN
		END
	END

	COMMIT TRANSACTION
END
GO

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song) VALUES('Joe Jonas', 'pop', 'solo', 'Idk', 'Cake by the Ocean');
