USE concert_tours;

DECLARE @TS_artistID [int]
DECLARE @Weekend_artistID [int]
DECLARE @BTS_artistID [int]
DECLARE @Goose_artistID [int]
DECLARE @karanAhuja_artistID [int]
DECLARE @fettyWap_artistID [int]
DECLARE @jasonDerulo_artistID [int]
DECLARE @agustd_artistID [int]
DECLARE @drake_artistID [int]
DECLARE @beyonce_artistID [int]
DECLARE @shakira_artistID [int]
DECLARE @lizzo_artistID [int]
DECLARE @arianaGrande_artistID [int]

DECLARE @ERAS_concertId [int]
DECLARE @AfterTours_concertID [int]
DECLARE @PTD_concertID [int]
DECLARE @BingoTour_concertID [int]
DECLARE @USAtour_concertID [int]
DECLARE @TheKingZoo_concertID [int]
DECLARE @TalkDirtyTour_concertID [int]
DECLARE @dday_concertID [int]
DECLARE @AubreyandtheThreeMigos_concertID [int]
DECLARE @ElDorado_concertID [int]
DECLARE @TheSpecialTour_concertID [int]
DECLARE @SweetenerWorldTour_concertID [int]
DECLARE @Renassiance_concertID [int]

DECLARE @MercedesBenz_ID [int]
DECLARE @MetlifeStadium_ID [int]
DECLARE @SofiStadium_ID [int] -- for bts concert
DECLARE @AllegiantStadium_ID [int] --for bts concert
DECLARE @UBSArena_ID [int] --for agustd
DECLARE @SchottensteinCenter_ID [int]
DECLARE @UniversityofPhoenixStadium_ID [int]
DECLARE @BeaverStadium_ID [int]
DECLARE @CenturyLinkField_ID [int]
DECLARE @CampingWorldStadium_ID [int]
DECLARE @EmiratesStadium_ID [int]
DECLARE @SanfordStadium_ID [int]
DECLARE @PaulBrownStadium_ID [int]
DECLARE @LucasOilStadium_ID [int]
DECLARE @RedBullArena_ID [int]
DECLARE @GilletteStadium_ID [int]
DECLARE @HighmarkStadium_ID [int]

DECLARE @neha_USERID [int]
DECLARE @vibha_USERID [int]
DECLARE @joy_USERID [int]

TRUNCATE TABLE Users
TRUNCATE TABLE Song
TRUNCATE TABLE Merchandise
TRUNCATE TABLE Tickets
DELETE FROM Concert
DBCC CHECKIDENT ('concert_tours.dbo.Concert', RESEED, 0)

DELETE FROM Artist
DBCC CHECKIDENT ('concert_tours.dbo.Artist', RESEED, 0)

DELETE FROM Venue
DBCC CHECKIDENT ('concert_tours.dbo.Venue', RESEED, 0)

--TRUNCATE TABLE Artist
--TRUNCATE TABLE Concert
--TRUNCATE TABLE Venue

--Artist declaration
INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Taylor Swift', 'pop', 'solo', '1989', 'Blank Space');
SET @TS_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('The Weekend', 'rnb', 'solo', 'After Hours', 'Blinding Lights');
SET @Weekend_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('BTS', 'pop', 'band/group', 'Proof', 'Butter');
SET @BTS_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Goose', 'rock', 'band/group', 'Dripfield', 'Arcadia');
SET @Goose_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Karan Ahuja', 'other', 'solo', 'Way ahead', 'On top');
SET @karanAhuja_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Fetty Wap', 'rap', 'solo', 'Fetty Wap(deluxe)', 'Trap Queen');
SET @fettyWap_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Jason Derulo', 'rnb', 'solo', 'Everything is 4', 'Savage Love');
SET @jasonDerulo_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Agust D', 'rap', 'solo', 'D-Day', 'D-Day');
SET @agustd_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Drake', 'rap', 'solo', 'Her loss', 'Rich Flex');
SET @drake_artistID = SCOPE_IDENTITY()

--beyonce, shakira, lizzo, ariana grande
INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Beyonce', 'rnb', 'solo', 'Renaissance', 'Cuff it');
SET @beyonce_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Shakira', 'global', 'solo', 'She Wolf', 'Hips dont lie');
SET @shakira_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Lizzo', 'rnb', 'solo', 'BG Small World', 'About damn time');
SET @lizzo_artistID = SCOPE_IDENTITY()

INSERT INTO Artist(artist_name, genre, artist_type, popular_album, popular_song)
VALUES('Ariana Grande', 'pop', 'solo', 'Dangerous Woman', 'God is a woman');
SET @arianaGrande_artistID = SCOPE_IDENTITY()


--Venue declaration
INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('MetLife Stadium', 'stadium', 'East Rutherfrod', 'NJ', 82500);
SET @MetlifeStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Mercedes-Benz Stadium', 'stadium', 'Atlanta', 'GA', 75000);
SET @MercedesBenz_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Sofi Stadium', 'stadium', 'Inglewood', 'CA', 70240);
SET @SofiStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Allegiant Stadium', 'stadium', 'Las Vegas', 'NV', 65000);
SET  @AllegiantStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('UBS Arena', 'arena', 'Elmont', 'NY', 17255);
SET  @UBSArena_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('University of Phoenix Stadium', 'stadium', 'Glendale', 'AZ', 63400);
SET  @UniversityofPhoenixStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Schottenstein Center', 'other', 'Columbus', 'OH', 18809);
SET  @SchottensteinCenter_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Beaver Stadium', 'stadium', 'Centre County', 'PA', 106572);
SET  @BeaverStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Century Link Field', 'other', 'Seattle', 'WA', 68740);
SET  @CenturyLinkField_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Camping World Stadium', 'stadium', 'Orlando', 'FL', 60219);
SET  @CampingWorldStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Emirates Stadium', 'stadium', 'London', 'UK', 60704);
SET  @EmiratesStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Sanford Stadium', 'stadium', 'Athens', 'GA', 92746);
SET  @SanfordStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Paul Brown Stadium', 'stadium', 'Cincinnati', 'OH', 65515);
SET  @PaulBrownStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Lucas Oil Stadium', 'stadium', 'Indianapolis', 'IN', 70000);
SET  @LucasOilStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Red Bull Arena', 'arena', 'Harrison', 'NJ', 25000);
SET  @RedBullArena_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Gillette Stadium', 'stadium', 'Foxborough', 'MA', 65878);
SET  @GilletteStadium_ID = SCOPE_IDENTITY()

INSERT INTO Venue(venue_name, venue_type, city,state, capacity)
VALUES('Highmark Stadium', 'stadium', 'Orchard Park', 'NY', 71608);
SET  @HighmarkStadium_ID = SCOPE_IDENTITY()


--Concert declaration
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Eras Tour', @TS_artistID, '2023-04-28' , '18:30:00', @MercedesBenz_ID);
SET @ERAS_concertId = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The After Hours Tour', @Weekend_artistID, '2022-07-19' , '18:30:00', @MetlifeStadium_ID);
SET @AfterTours_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('PTD Tour', @BTS_artistID, '2022-04-26' , '20:30:00', @SofiStadium_ID);
SET @PTD_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Bingo Tour', @Goose_artistID, '2020-11-07' , '16:30:00', @AllegiantStadium_ID);
SET @BingoTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The King Zoo',@fettyWap_artistID , '2015-07-14' , '19:00:00', @UBSArena_ID);
SET @TheKingZoo_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('USA Tour', @karanAhuja_artistID, '2020-11-07' , '16:30:00', @SchottensteinCenter_ID);
SET @USAtour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Talk Dirty Tour',@jasonDerulo_artistID, '2020-02-16' , '18:30:00', @UniversityofPhoenixStadium_ID);
SET @TalkDirtyTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('DDay Tour',@agustd_artistID, '2023-05-31' , '17:30:00', @BeaverStadium_ID);
SET @dday_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Aubrey and the Three Migos',@drake_artistID, '2018-08-12' , '21:30:00', @CenturyLinkField_ID);
SET  @AubreyandtheThreeMigos_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('El Dorado Tour', @shakira_artistID , '2018-03-06' , '20:30:00',  @CampingWorldStadium_ID);
SET @ElDorado_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Special Tours', @lizzo_artistID, '2023-05-11' , '20:30:00', @PaulBrownStadium_ID);
SET  @TheSpecialTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Sweetener World Tour',  @arianaGrande_artistID, '2018-10-25' , '20:00:00', @RedBullArena_ID);
SET @SweetenerWorldTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Renassiance Tour',  @beyonce_artistID, '2023-05-10' , '20:00:00', @GilletteStadium_ID);
SET @Renassiance_concertID = SCOPE_IDENTITY()


--Merch declaration
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ERAS_concertId, 'Swiftie Sweatshirt', 'hoodie', 40, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ERAS_concertId, 'Swiftie Pants', 'pants', 35, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ERAS_concertId, 'Swiftie Keychain', 'keychain', 10, 100);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AfterTours_concertID, 'After Tours shirt', 'shirt', 40, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AfterTours_concertID, 'After Tours hoodie', 'hoodie', 80, 170);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@PTD_concertID, 'PTD Sweatshirt', 'hoodie', 140, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@PTD_concertID, 'PTD keychain', 'hat', 40, 700);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BingoTour_concertID, 'Bingo keychain', 'keychain', 17, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BingoTour_concertID, 'Bingo hat', 'hat', 30, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BingoTour_concertID, 'Bingo hoodie', 'hoodie', 50, 180);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@USAtour_concertID, 'USA Scarf', 'other clothing', 40, 500);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@USAtour_concertID, 'USA Sweatshirt', 'hoodie', 90, 500);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingZoo_concertID, 'KZ Sweatshirt', 'hoodie', 60, 70);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingZoo_concertID, 'KZ keychain', 'keychain', 30, 90);



INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'TD Sweatshirt', 'hoodie', 150, 70);



INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@dday_concertID, 'Dday Sweatshirt', 'hoodie', 440, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@dday_concertID, 'Dday hat', 'hat', 140, 70);


INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'Drake Sweatshirt', 'hoodie', 240, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ElDorado_concertID, 'Shakira Sweatshirt','shirt', 140, 80);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheSpecialTour_concertID, 'Lizzo Sweatshirt', 'poster', 180, 90);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'AG Sweatshirt', 'hoodie', 300, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Renassiance_concertID, 'Beyonce Sweatshirt', 'shirt', 900, 170);




--Ticket declaration 
INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'VIP', 2090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'General Admission', 400, 1400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'Premium', 990, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'Balcony', 1090, 400);



INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'VIP', 3400, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'General Admission', 1090, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'Upper (Seated)', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'Lower (Seated)', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'Premium', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'Balcony', 2000, 2000);



INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'Upper (Seated)', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'Lower (Seated)', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'Premium', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'Balcony', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'General Admission', 1300, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'Premium', 2300, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'Balcony', 2050, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'General Admission', 1500, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'Upper (Seated)', 2070, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'Lower (Seated)', 2060, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'Premium', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'Balcony', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'Premium', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'Balcony', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'Upper (Seated)', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'Lower (Seated)', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'Upper (Seated)', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'Lower (Seated)', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'Upper (Seated)', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'Lower (Seated)', 2000, 2000);


INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'VIP', 4000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'General Admission', 1000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'Premium', 2000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'Balcony', 2000, 2000);


/*

DECLARE @TS_artistID [int]
DECLARE @Weekend_artistID [int]
DECLARE @BTS_artistID [int]
DECLARE @Goose_artistID [int]
DECLARE @karanAhuja_artistID [int]
DECLARE @fettyWap_artistID [int]
DECLARE @jasonDerulo_artistID [int]
DECLARE @agustd_artistID [int]
DECLARE @drake_artistID [int]
DECLARE @beyonce_artistID [int]
DECLARE @shakira_artistID [int]
DECLARE @lizzo_artistID [int]
DECLARE @arianaGrande_artistID [int]


*/

--Song declaration
INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Snow on the Beach', @TS_artistID, 'Midnights', '2022-10-21');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Blinding Lights',  @Weekend_artistID, 'After Hours', '2020-11-19');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Dope', @BTS_artistID, 'MBMIL', '2015-04-29');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Arcadia',  @Goose_artistID, 'Dripfield', '2022-06-24');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('On top', @karanAhuja_artistID, 'Way ahead', '2022-05-09');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Trap Queen', @fettyWap_artistID, 'Fetty Wap(Deluxe)', '2015-10-19');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Savage Love', @jasonDerulo_artistID, 'Everything is 4', '2020-06-19');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Haegeum', @agustd_artistID, 'D-Day', '2022-06-24');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Rich Flex', @drake_artistID, 'Her Loss', '2022-03-19');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Cuff it',  @beyonce_artistID, 'Renaissance', '2022-12-19');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('Hips Dont Lie', @shakira_artistID, 'Monotonia', '2005-02-12');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('About Damn Time',@lizzo_artistID, 'Special', '2022-03-24');

INSERT INTO Song(song_name, artist_id, album, release_date)
VALUES('One last time',@arianaGrande_artistID, 'Positions', '2020-06-24');


--USER 
--default value to 0
INSERT INTO Users(username, balance, num_tickets_purchased, num_merch_purchased)
VALUES('nxp330', 0, 0, 0);
SET @neha_USERID = SCOPE_IDENTITY()


INSERT INTO Users(username, balance, num_tickets_purchased, num_merch_purchased)
VALUES('vsm21', 0, 0, 0);
SET @vibha_USERID = SCOPE_IDENTITY()


INSERT INTO Users(username, balance, num_tickets_purchased, num_merch_purchased)
VALUES('jyf6', 0, 0, 0);
SET @joy_USERID = SCOPE_IDENTITY()
