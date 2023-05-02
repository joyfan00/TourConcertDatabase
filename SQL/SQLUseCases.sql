USE tours;

GO
CREATE PROCEDURE find_setlist2
    (@TourName VARCHAR(40), @DateOfShow DATE)
AS
BEGIN
	
	BEGIN TRANSACTION
	SELECT Song.song_name, Artist.artist_name, Song.album
	FROM (Concert INNER JOIN Artist ON Concert.artist_id = Artist.id) INNER JOIN Song ON Song.artist_id = Artist.id
	WHERE Concert.tour_name = @TourName AND Concert.date_of_show = @DateOfShow
	COMMIT TRANSACTION

END
GO

EXEC find_setlist2 'The Eras Tour', '2023-04-28'

GO

--Second Query Rerun 
CREATE PROCEDURE find_artist
    (@StartDate DATE, @EndDate DATE, @VenueCity VARCHAR(20), @VenueState VARCHAR(20))
AS
BEGIN
	
	BEGIN TRANSACTION
	SELECT Artist.artist_name, Concert.tour_name, Concert.date_of_show
	FROM (Concert INNER JOIN Artist ON Concert.artist_id = Artist.id) INNER JOIN Venue ON Concert.venue_id = Venue.id
	WHERE Concert.date_of_show >= @StartDate AND Concert.date_of_show <= @EndDate AND Venue.city = @VenueCity AND Venue.state = @VenueState
	COMMIT TRANSACTION
END
GO

EXEC find_artist '2012-04-26', '2023-04-30', 'Atlanta', 'GA'



GO

--Third Query 
CREATE PROCEDURE add_merch
    (@TourName varchar(40), @DateofShow DATE, @ItemName varchar(20), @ItemCategory varchar(20), @ItemPrice bigInt, @ItemQuantity int)
AS
BEGIN
	BEGIN TRANSACTION
	INSERT INTO Merchandise (concert_id, item_name, category, price, quantity)
	VALUES ((SELECT Concert.id FROM Concert WHERE Concert.tour_name = @TourName AND Concert.date_of_show = @DateOfShow), @ItemName, @ItemCategory, @ItemPrice, @ItemQuantity)

	IF @@ERROR <> 0
	BEGIN
	    -- Rollback the transaction if there was an error
	    ROLLBACK TRANSACTION
	    RETURN
	END

	COMMIT TRANSACTION
	

END
GO

EXEC add_merch 'PTD Tour', '2022-04-26', 'LightStick', 'other item',7500, 50


GO

--Query 4
CREATE PROCEDURE delete_concert
    (@TourName varchar(40), @DateofShow DATE)
AS
BEGIN
	BEGIN TRANSACTION
	DELETE FROM Concert
	WHERE Concert.tour_name = @TourName AND Concert.date_of_show = @DateOfShow 
	
	IF @@ERROR <> 0
	BEGIN
	    -- Rollback the transaction if there was an error
	    ROLLBACK TRANSACTION
	    RETURN
	END

	COMMIT TRANSACTION
END
GO

EXEC delete_concert 'Talk Dirty Tour', '2020-02-16'

GO

CREATE PROCEDURE buy_tickets 
    @Username VARCHAR(40), @TourName VARCHAR(40), @DateOfShow DATE, @Section VARCHAR(20), @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ConcertID INT;
	DECLARE @Price BIGINT;
    
    -- Start a transaction
    BEGIN TRANSACTION
    
	SELECT @ConcertID = Concert.id FROM Concert WHERE Concert.tour_name = @TourName AND Concert.date_of_show = @DateOfShow
	SELECT @Price = Tickets.price FROM Tickets WHERE Tickets.concert_id = @ConcertId AND Tickets.section = @Section

    -- Check if there are enough tickets
    IF (SELECT Tickets.quantity FROM Tickets WHERE Tickets.concert_id = @ConcertID AND Tickets.section = @Section) >= @Quantity
    BEGIN
        -- Update the ticket quantity
        UPDATE Tickets SET Tickets.quantity = Tickets.quantity - @Quantity WHERE Tickets.concert_id = @ConcertID AND Tickets.section = @Section
        UPDATE Users SET Users.balance = Users.balance + (@Price * @Quantity) WHERE Users.username = @Username
		UPDATE Users SET Users.num_tickets_purchased = Users.num_tickets_purchased + @Quantity WHERE Users.username = @Username
        -- Commit the transaction
        COMMIT TRANSACTION
    END
    ELSE
    BEGIN
        -- Rollback the transaction
        ROLLBACK TRANSACTION
        
        PRINT 'Not enough tickets available!'
    END
END
GO

EXEC buy_tickets 'jyf6', 'DDay Tour', '2023-05-31', 'VIP', 3
GO

CREATE PROCEDURE buy_merchandise 
    @Username VARCHAR(40), @TourName VARCHAR(40), @DateOfShow DATE, @ItemName VARCHAR(20), @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ConcertID INT;
	DECLARE @Price BIGINT;
    
    -- Start a transaction
    BEGIN TRANSACTION
   
	

    -- Check if there are enough tickets
    IF (SELECT Merchandise.quantity FROM Merchandise WHERE Merchandise.concert_id = @ConcertID AND Merchandise.item_name = @ItemName) >= @Quantity
    BEGIN
        -- Update the ticket quantity
        UPDATE Merchandise SET Merchandise.quantity = Merchandise.quantity - @Quantity WHERE Merchandise.concert_id = (SELECT @ConcertID = Concert.id FROM Concert WHERE Concert.tour_name = @TourName AND Concert.date_of_show = @DateOfShow) AND Merchandise.item_name = @ItemName
        UPDATE Users SET Users.balance = Users.balance + ((SELECT @Price = Merchandise.price FROM Merchandise WHERE Merchandise.concert_id = (SELECT @ConcertID = Concert.id FROM Concert WHERE Concert.tour_name = @TourName AND Concert.date_of_show = @DateOfShow) AND Merchandise.item_name = @ItemName) * @Quantity) WHERE Users.username = @Username
		UPDATE Users SET Users.num_merch_purchased = Users.num_merch_purchased + @Quantity WHERE Users.username = @Username
        -- Commit the transaction
        COMMIT TRANSACTION
    END
    ELSE
    BEGIN
        -- Rollback the transaction
        ROLLBACK TRANSACTION
        
        PRINT 'Not enough merchandise available!'
    END
END
GO

EXEC buy_merchandise 'nxp330', 'PTD Tour', '2022-04-26', 'PTD Sweatshirt', 2
GO

--Fake query
CREATE PROCEDURE add_NewUser
    (@UserName varchar(40))
AS
BEGIN
	BEGIN TRANSACTION
	INSERT INTO Users (username)
	VALUES (@UserName);
	SELECT id FROM Users WHERE username = @UserName

	IF @@ERROR <> 0
	BEGIN
	    -- Rollback the transaction if there was an error
	    ROLLBACK TRANSACTION
	    RETURN
	END

	COMMIT TRANSACTION
END
GO


EXEC add_NewUser 'connie'
GO

CREATE PROCEDURE checkUsers
    (@UserName varchar(40))
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        IF EXISTS (SELECT * FROM Users WHERE Users.username = @UserName)
        BEGIN
            SELECT Users.username, Users.balance, Users.num_merch_purchased, Users.num_tickets_purchased FROM Users WHERE Users.username = @UserName;
        END
        ELSE
        BEGIN
            RAISERROR ('Username not found', 16, 1);
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END







GO
EXEC checkUsers 'hhh'
GO

/*GO 
	ALTER DATABASE tours
	SET RECURSIVE_TRIGGERS OFF
GO
*/

/*
SELECT song.name, song.artist, song.release_date, song.album
FROM concert
INNER JOIN artist ON concert.artist_id = artist.id
INNER JOIN song ON song.artist_id = artist.id
WHERE concert.tour_name = '{input}' AND concert.date_of_show = '{input}'
*/