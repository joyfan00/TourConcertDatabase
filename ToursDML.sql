USE tours;

--Population Table declaration
--Add values into tables

--id variables for artists
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

--id variables for concerts
--variables for taylor swift concert
DECLARE @ERAS_concertId [int]
DECLARE @Reputation_concertID [int]
DECLARE @1989_concertID [int]
DECLARE @SpeakNow_concertID [int]

--variables for weekend concert
DECLARE @AfterTours_concertID [int]
DECLARE @StarBoy_concertID [int]
DECLARE @TheMadness_concertID [int]
DECLARE @TheKingoftheFall_concertID [int]

--variables for bts concert
DECLARE @PTD_concertID [int]
DECLARE @LoveYourself_concertID [int]
DECLARE @MBMLS_concertID [int]
DECLARE @RedBullet_concertID [int]

--variable for goose concert
DECLARE @BingoTour_concertID [int]
DECLARE @Thekla_concertID [int]
DECLARE @Gorilla_concertID [int]
DECLARE @RedRocks_concertID [int]
 
DECLARE @USAtour_concertID [int]
DECLARE @UKtour_concertID [int]
DECLARE @India_concertID [int]

DECLARE @TheKingZoo_concertID [int]
DECLARE @SaturdayInthePark_concertID [int]
DECLARE @SpringFever_concertID [int]
DECLARE @RollingLoud_concertID [int]

DECLARE @TalkDirtyTour_concertID [int]
DECLARE @Lollapalooza_concertID [int]
DECLARE @SummerDaze_concertID [int]

DECLARE @dday_concertID [int]
DECLARE @life_concertID [int]

DECLARE @AubreyandtheThreeMigos_concertID [int]
DECLARE @ItsAllABlur_concertID [int]
DECLARE @AwayFromHome_concertID [int]
DECLARE @ClubParadise_concertID [int]
DECLARE @SummerSixteen_concertID [int]

DECLARE @ElDorado_concertID [int]
DECLARE @PiesDecalzos_concertID [int]
DECLARE @TheSunComesOutWorld_concertID [int]
DECLARE @TourofMongoose_concertID [int]

DECLARE @TheSpecialTour_concertID [int]
DECLARE @Loolpalooza2_concertID [int]
DECLARE @BottleRock_concertID [int]

DECLARE @SweetenerWorldTour_concertID [int]
DECLARE @HoneyMoonTour_concertID [int]
DECLARE @DangerousWoman_concertID [int]

DECLARE @OntheRun_concertID [int]
DECLARE @Formation_concertID [int]
DECLARE @IAMWorld_concertID [int]
DECLARE @DangerouslyInLove_concertID [int]
DECLARE @Renassiance_concertID [int]

--variables for the venue 
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

--variables for the user
DECLARE @neha_USERID [int]
DECLARE @vibha_USERID [int]
DECLARE @joy_USERID [int]

--clear tables before populating 
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

/*

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

*/

--Concert declaration
--taylor swift tours
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Eras Tour', @TS_artistID, '2023-04-28' , '18:30:00', @MercedesBenz_ID);
SET @ERAS_concertId = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Reputation Stadium Tour', @TS_artistID, '2018-09-28' , '18:30:00', @AllegiantStadium_ID);
SET @Reputation_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The 1989 Tour', @TS_artistID, '2015-05-15' , '20:30:00', @HighmarkStadium_ID);
SET  @1989_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Speak Now Stadium Tour', @TS_artistID, '2011-02-08' , '18:30:00', @RedBullArena_ID);
SET @SpeakNow_concertID = SCOPE_IDENTITY()

--weekend tours
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The After Hours Tour', @Weekend_artistID, '2022-07-19' , '18:30:00', @MetlifeStadium_ID);
SET @AfterTours_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Star Boy Tour', @Weekend_artistID, '2017-02-17' , '18:30:00', @BeaverStadium_ID);
SET @StarBoy_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Madness Tour', @Weekend_artistID, '2023-06-09' , '20:30:00', @SanfordStadium_ID);
SET  @TheMadness_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The King of the Fall', @Weekend_artistID, '2014-10-11' , '20:30:00', @UniversityofPhoenixStadium_ID);
SET  @TheKingoftheFall_concertID = SCOPE_IDENTITY()

--bts tours
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('PTD Tour', @BTS_artistID, '2021-10-04' , '20:30:00', @LucasOilStadium_ID);
SET @PTD_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Love Yourself', @BTS_artistID, '2018-08-25' , '20:30:00', @UniversityofPhoenixStadium_ID);
SET @LoveYourself_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('MBMLS Tour', @BTS_artistID, '2015-11-27' , '20:30:00', @UBSArena_ID);
SET @MBMLS_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Red Bullet Tour', @BTS_artistID, '2015-06-06' , '20:30:00',  @CampingWorldStadium_ID);
SET @RedBullet_concertID = SCOPE_IDENTITY()

--goose tours
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Bingo Tour', @Goose_artistID, '2020-05-07' , '16:30:00', @SchottensteinCenter_ID);
SET @BingoTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Thekla Tour', @Goose_artistID, '2020-11-07' , '16:30:00', @AllegiantStadium_ID);
SET @Thekla_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Gorilla Tour', @Goose_artistID, '2023-05-02' , '18:30:00',  @UBSArena_ID);
SET @Gorilla_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Red Rocks Tour', @Goose_artistID, '2021-12-07' , '17:30:00', @CampingWorldStadium_ID);
SET @RedRocks_concertID = SCOPE_IDENTITY()

--fetty wap tours
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The King Zoo',@fettyWap_artistID , '2015-07-14' , '19:00:00', @UBSArena_ID);
SET @TheKingZoo_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Saturday In the Park',@fettyWap_artistID , '2015-07-14' , '19:00:00', @UBSArena_ID);
SET  @SaturdayInthePark_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Spring Fever',@fettyWap_artistID , '2015-07-14' , '19:00:00', @UBSArena_ID);
SET @SpringFever_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Rolling Loud',@fettyWap_artistID , '2015-07-14' , '19:00:00', @UBSArena_ID);
SET  @RollingLoud_concertID = SCOPE_IDENTITY()

--karan Ahuja concerts
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('USA Tour', @karanAhuja_artistID, '2020-11-07' , '16:30:00', @SchottensteinCenter_ID);
SET @USAtour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('UK Tour', @karanAhuja_artistID, '2014-04-18' , '18:30:00', @PaulBrownStadium_ID);
SET @UKtour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('India Tour', @karanAhuja_artistID, '2014-04-18' , '18:30:00', @PaulBrownStadium_ID);
SET @India_concertID = SCOPE_IDENTITY()

--jason derulo concerts
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Talk Dirty Tour',@jasonDerulo_artistID, '2022-01-12' , '18:30:00', @UniversityofPhoenixStadium_ID);
SET @TalkDirtyTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Lollapalooza Tour',@jasonDerulo_artistID, '2020-02-16' , '20:30:00', @GilletteStadium_ID);
SET @Lollapalooza_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Summer Daze Tour',@jasonDerulo_artistID, '2019-03-17' , '19:30:00', @SchottensteinCenter_ID);
SET @SummerDaze_concertID = SCOPE_IDENTITY()

-- agustd concerts
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('DDay Tour',@agustd_artistID, '2023-05-31' , '17:30:00', @BeaverStadium_ID);
SET @dday_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Life Tour',@agustd_artistID, '2008-03-07' , '19:30:00', @CenturyLinkField_ID);
SET @life_concertID = SCOPE_IDENTITY()

-- drake concerts
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Aubrey and the Three Migos',@drake_artistID, '2013-05-14' , '15:00:00', @CenturyLinkField_ID);
SET  @AubreyandtheThreeMigos_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Its All A Blur Tour',@drake_artistID, '2018-08-12' , '20:00:00', @UniversityofPhoenixStadium_ID);
SET  @ItsAllABlur_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Away from Home Tour',@drake_artistID, '2015-09-14' , '21:30:00', @LucasOilStadium_ID);
SET  @AwayFromHome_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Club Paradise Tour',@drake_artistID, '2021-07-13' , '22:30:00', @GilletteStadium_ID);
SET  @ClubParadise_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Summer Sixteen Tour',@drake_artistID, '2018-08-1' , '19:30:00', @PaulBrownStadium_ID);
SET  @SummerSixteen_concertID = SCOPE_IDENTITY()

-- shakira concert
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('El Dorado Tour', @shakira_artistID , '2017-02-16' , '18:30:00',  @CampingWorldStadium_ID);
SET @ElDorado_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Pies Decalzos', @shakira_artistID , '2023-03-06' , '20:00:00',  @GilletteStadium_ID);
SET @PiesDecalzos_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Sun Comes Out World', @shakira_artistID , '2018-04-26' , '19:00:00',  @LucasOilStadium_ID);
SET @TheSunComesOutWorld_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Tour of Mongoose', @shakira_artistID , '2014-01-14' , '20:30:00',  @UniversityofPhoenixStadium_ID);
SET @TourofMongoose_concertID = SCOPE_IDENTITY()

-- lizzo concert
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('The Special Tours', @lizzo_artistID, '2021-04-12' , '19:00:00', @PaulBrownStadium_ID);
SET  @TheSpecialTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Loolpalooza Tours', @lizzo_artistID, '2023-04-11' , '20:30:00', @UniversityofPhoenixStadium_ID);
SET  @Loolpalooza2_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Bottle Rock Tours', @lizzo_artistID, '2013-06-11' , '18:00:00', @LucasOilStadium_ID);
SET  @BottleRock_concertID = SCOPE_IDENTITY()

-- ariana grande concert
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Sweetener World Tour',  @arianaGrande_artistID, '2018-10-25' , '20:00:00', @RedBullArena_ID);
SET @SweetenerWorldTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Honey Moon Tour',  @arianaGrande_artistID, '2008-08-20' , '18:00:00', @LucasOilStadium_ID);
SET @HoneyMoonTour_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Dangerous Woman Tour',  @arianaGrande_artistID, '2019-06-12' , '19:30:00', @GilletteStadium_ID);
SET @DangerousWoman_concertID = SCOPE_IDENTITY()

-- beyonce concert
INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Renassiance Tour',  @beyonce_artistID, '2013-04-12' , '19:00:00', @GilletteStadium_ID);
SET @Renassiance_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Dangerously In Love Tour',  @beyonce_artistID, '2020-03-16' , '21:00:00', @UniversityofPhoenixStadium_ID);
SET @DangerouslyInLove_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('I am World Tour',  @beyonce_artistID, '2023-05-10' , '20:00:00', @LucasOilStadium_ID);
SET @IAMWorld_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('Formation Tour',  @beyonce_artistID, '2022-06-15' , '18:30:00', @SchottensteinCenter_ID);
SET @Formation_concertID = SCOPE_IDENTITY()

INSERT INTO Concert(tour_name, artist_id, date_of_show, time_start, venue_id)
VALUES ('On the Run Tour',  @beyonce_artistID, '2021-04-10' , '19:00:00', @AllegiantStadium_ID);
SET @OntheRun_concertID = SCOPE_IDENTITY()

--Merch declaration
--taylor swift merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ERAS_concertId, 'Swiftie Sweatshirt', 'hoodie', 4000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ERAS_concertId, 'Swiftie Pants', 'pants', 3500, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ERAS_concertId, 'Swiftie Keychain', 'keychain', 1000, 100);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Reputation_concertID, 'Reputation Sweatshirt', 'hoodie', 5000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Reputation_concertID, 'Reputation Pants', 'pants', 4000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Reputation_concertID, 'Reputation Keychain', 'keychain', 1000, 100);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@1989_concertID, '1989 Sweatshirt', 'hoodie', 7000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@1989_concertID, '1989 Pants', 'pants', 9000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@1989_concertID, '1989 Keychain', 'keychain', 2000, 100);

--weekend merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AfterTours_concertID, 'After Tours shirt', 'shirt', 4000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AfterTours_concertID, 'After Tours hoodie', 'hoodie', 8000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AfterTours_concertID, 'After Tours pants', 'pants', 4000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@StarBoy_concertID, 'StarBoy hoodie', 'hoodie', 8000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@StarBoy_concertID, 'StarBoy shirt', 'shirt', 4000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@StarBoy_concertID, 'StarBoy pants', 'pants', 8000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheMadness_concertID, 'The Madness hoodie', 'hoodie', 9000, 100);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheMadness_concertID, 'The Madness shirt', 'shirt', 4000, 270);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheMadness_concertID, 'The Madness pants', 'pants', 8000, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'The king of the fall hoodie', 'hoodie', 10000, 100);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'The king of the fall shirt', 'shirt', 3000, 270);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'The king of the fall pants', 'pants', 7000, 700);

--bts merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@LoveYourself_concertID, 'Love yourself hoodie', 'hoodie', 20000, 200);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@LoveYourself_concertID, 'Love yourself shirt', 'shirt', 7000, 370);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@LoveYourself_concertID, 'Love yourself pants', 'pants', 9000, 900);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@MBMLS_concertID, 'MBMLS Sweatshirt', 'hoodie', 14000, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@MBMLS_concertID, 'MBMLS hat', 'hat', 4000, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RedBullet_concertID, 'Red Bullet Sweatshirt', 'hoodie', 14000, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RedBullet_concertID, 'Red Bullet hat', 'hat', 4000, 700);

--goose merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BingoTour_concertID, 'Bingo keychain', 'keychain', 1700, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BingoTour_concertID, 'Bingo hat', 'hat', 3000, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BingoTour_concertID, 'Bingo hoodie', 'hoodie', 5000, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Thekla_concertID, 'Thekla keychain', 'keychain', 2700, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Thekla_concertID, 'Thekla hat', 'hat', 3000, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Thekla_concertID, 'Thekla hoodie', 'hoodie', 5000, 180);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Gorilla_concertID, 'Gorilla keychain', 'keychain', 3700, 280);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Gorilla_concertID, 'Gorilla hat', 'hat', 4000, 280);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Gorilla_concertID, 'Gorilla hoodie', 'hoodie', 5500, 280);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RedRocks_concertID, 'Red Rocks keychain', 'keychain', 7700, 1080);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RedRocks_concertID, 'Red Rocks hat', 'hat', 4500, 1800);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RedRocks_concertID, 'Red Rocks hoodie', 'hoodie', 6500, 1700);

--karan ahujla
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@USAtour_concertID, 'USA Scarf', 'other clothing', 4000, 500);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@USAtour_concertID, 'USA Sweatshirt', 'hoodie', 9000, 500);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@UKtour_concertID, 'Uk Scarf', 'other clothing', 4500, 600);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@UKtour_concertID, 'Uk Sweatshirt', 'hoodie', 9500, 500);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@India_concertID, 'India Scarf', 'other clothing', 5500, 650);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@India_concertID, 'India Sweatshirt', 'hoodie', 1500, 550);

--fetty wap merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingZoo_concertID, 'KZ Sweatshirt', 'hoodie', 6000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheKingZoo_concertID, 'KZ keychain', 'keychain', 3000, 190);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SaturdayInthePark_concertID, 'SP Sweatshirt', 'hoodie', 5000, 370);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SaturdayInthePark_concertID, 'SP keychain', 'keychain', 4000, 390);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SpringFever_concertID, 'SF Sweatshirt', 'hoodie', 6500, 870);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SpringFever_concertID, 'SF keychain', 'keychain', 3500, 890);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RollingLoud_concertID, 'RL Sweatshirt', 'hoodie', 6000, 800);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@RollingLoud_concertID, 'RL keychain', 'keychain', 3000, 800);

--jason derulo merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'TD Sweatshirt', 'hoodie', 15000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'TD Sweatshirt', 'hoodie', 15000, 70);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Lollapalooza_concertID, 'Lolla Sweatshirt', 'hoodie', 40000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Lollapalooza_concertID, 'Lolla Sweatshirt', 'hoodie', 20000, 170);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SummerDaze_concertID, 'Summer Daze Sweatshirt', 'hoodie', 50000, 1070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SummerDaze_concertID, 'Summer Daze Sweatshirt', 'hoodie', 10000, 1070);

--agustd merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@dday_concertID, 'Dday Sweatshirt', 'hoodie', 44000, 270);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@dday_concertID, 'Dday hat', 'hat', 14000, 270);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@life_concertID, 'Life Sweatshirt', 'hoodie', 50000, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@life_concertID, 'Life hat', 'hat', 40000, 700);

-drake merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'Drake Sweatshirt', 'hoodie', 24000, 1070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ItsAllABlur_concertID, 'Blur Sweatshirt', 'hoodie', 20000, 1700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@AwayFromHome_concertID, 'Away Sweatshirt', 'hoodie', 35000, 2070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ClubParadise_concertID, 'Club Sweatshirt', 'hoodie', 19000, 2700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SummerSixteen_concertID, 'Summer Sweatshirt', 'hoodie', 39000, 3700);

-- shakira merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@ElDorado_concertID, 'ED Sweatshirt','shirt', 16000, 80);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@PiesDecalzos_concertID, 'PD Sweatshirt', 'hoodie', 25000, 1700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheSunComesOutWorld_concertID, 'Sun Sweatshirt', 'hoodie', 30000, 2070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TourofMongoose_concertID, 'Mongoose Sweatshirt', 'hoodie', 17000, 2700);

--lizzo merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@TheSpecialTour_concertID, 'ST poster', 'poster', 18000, 90);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Loolpalooza2_concertID, 'LP poster', 'poster', 20000, 190);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@BottleRock_concertID, 'BottleRock poster', 'poster', 28000, 900);

--ariana grande merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'Sweetener Sweatshirt', 'hoodie', 30000, 1070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@HoneyMoonTour_concertID, 'HM Sweatshirt', 'hoodie', 35000, 700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@DangerousWoman_concertID, 'DW Sweatshirt', 'hoodie', 40000, 700);

--beyonce merch
INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Renassiance_concertID, 'Renassiance shirt', 'shirt', 95000, 1070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@DangerouslyInLove_concertID, 'DIL shirt', 'shirt', 900000, 1800);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@IAMWorld_concertID, 'I am world shirt', 'shirt', 60000, 4700);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@Formation_concertID, 'Formation shirt', 'shirt', 30000, 2070);

INSERT INTO Merchandise(concert_id,item_name, category, price, quantity)
VALUES(@OntheRun_concertID, 'OTR shirt', 'shirt', 35000, 8970);

--Ticket declaration
--taylor swift tickets
INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'VIP', 2090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'General Admission', 400, 1400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'Premium', 990, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ERAS_concertId, 'Balcony', 1090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Reputation_concertID, 'VIP', 2090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Reputation_concertID, 'General Admission', 400, 1400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Reputation_concertID, 'Premium', 990, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Reputation_concertID, 'Balcony', 1090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@1989_concertID, 'VIP', 2090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@1989_concertID, 'General Admission', 400, 1400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@1989_concertID, 'Premium', 990, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@1989_concertID, 'Balcony', 1090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SpeakNow_concertID, 'VIP', 2090, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SpeakNow_concertID, 'General Admission', 400, 1400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SpeakNow_concertID, 'Premium', 990, 400);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SpeakNow_concertID, 'Balcony', 1090, 400);

--weekend tickets
INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'VIP', 34000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'General Admission', 10900, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'Upper (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AfterTours_concertID, 'Lower (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@StarBoy_concertID, 'VIP', 34000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@StarBoy_concertID, 'General Admission', 10900, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@StarBoy_concertID, 'Upper (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@StarBoy_concertID, 'Lower (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheMadness_concertID, 'VIP', 34000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheMadness_concertID, 'General Admission', 10900, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheMadness_concertID, 'Upper (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheMadness_concertID, 'Lower (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'VIP', 34000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'General Admission', 10900, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'Upper (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingoftheFall_concertID, 'Lower (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'General Admission', 10000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'Premium', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@PTD_concertID, 'Balcony', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@LoveYourself_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@LoveYourself_concertID, 'General Admission', 10000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@LoveYourself_concertID, 'Premium', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@LoveYourself_concertID, 'Balcony', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@MBMLS_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@RedBullet_concertID, 'General Admission', 10000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@LoveYourself_concertID, 'Premium', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@LoveYourself_concertID, 'Balcony', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'General Admission', 10000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'Upper (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@BingoTour_concertID, 'Lower (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'General Admission', 10000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'Premium', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@USAtour_concertID, 'Balcony', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'General Admission', 13000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'Premium', 23000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheKingZoo_concertID, 'Balcony', 20500, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'VIP', 40000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'General Admission', 15000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'Upper (Seated)', 20700, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TalkDirtyTour_concertID, 'Lower (Seated)', 20600, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'VIP', 90000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'General Admission', 60000, 4000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'Premium', 80000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@dday_concertID, 'Balcony', 70000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'VIP', 85000, 100);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'General Admission', 15000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'Premium', 45000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@AubreyandtheThreeMigos_concertID, 'Balcony', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'VIP', 80000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'General Admission', 10000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'Upper (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@ElDorado_concertID, 'Lower (Seated)', 20000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'VIP', 100000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'General Admission', 50000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'Upper (Seated)', 70000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@TheSpecialTour_concertID, 'Lower (Seated)', 70000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'VIP', 400000, 1000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'General Admission', 100000, 3000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'Upper (Seated)', 200000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@SweetenerWorldTour_concertID, 'Lower (Seated)', 200000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'VIP', 400000, 2000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'General Admission', 100000, 7000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'Premium', 300000, 4000);

INSERT INTO Tickets(concert_id, section, price, quantity)
VALUES(@Renassiance_concertID, 'Balcony', 200000, 2000);

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
INSERT INTO Song(song_name, artist_id, album)
VALUES('Blank Space', @TS_artistID, '1989');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Shake it off', @TS_artistID, '1989');

INSERT INTO Song(song_name, artist_id, album)
VALUES('You belong with me', @TS_artistID, 'Fearless');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Look what you made me do', @TS_artistID, 'Reputation');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Bad Blood', @TS_artistID, '1989');

INSERT INTO Song(song_name, artist_id, album)
VALUES('I knew you were trouble', @TS_artistID, 'Red');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Save Your Tears',  @Weekend_artistID, 'After Hours');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Starboy',  @Weekend_artistID, 'Starboy');

INSERT INTO Song(song_name, artist_id, album)
VALUES('I was never there',  @Weekend_artistID, 'My Dear Melancholy');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Call Out My Name',  @Weekend_artistID, 'My Dear Melancholy');

INSERT INTO Song(song_name, artist_id, album)
VALUES('The Hills',  @Weekend_artistID, 'The Hills');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Dynamite', @BTS_artistID, 'BE');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Permission to Dance', @BTS_artistID, 'Permission to Dance');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Butter', @BTS_artistID, 'Map of the soul');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Blood Sweat and Tears', @BTS_artistID, 'Wings');

INSERT INTO Song(song_name, artist_id, album)
VALUES('IDOL', @BTS_artistID, 'Love Yourself:Answer');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Life Goes On', @BTS_artistID, 'BE');

INSERT INTO Song(song_name, artist_id, album)
VALUES('DNA', @BTS_artistID, 'Love Yourself:Tear');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Hungersite',  @Goose_artistID, 'Goosemas');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Madhuvan',  @Goose_artistID, 'Covington, KY');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Wysteria Lane',  @Goose_artistID, 'Covington, KY');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Echo Of A Rose',  @Goose_artistID, 'South Farms');

INSERT INTO Song(song_name, artist_id, album)
VALUES('So Ready',  @Goose_artistID,'Covington, KY');

INSERT INTO Song(song_name, artist_id, album)
VALUES('52 bars', @karanAhuja_artistID, 'Four You');

INSERT INTO Song(song_name, artist_id, album)
VALUES('White brown black', @karanAhuja_artistID, 'White brown black');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Take it easy', @karanAhuja_artistID, 'Four You');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Players', @karanAhuja_artistID, '3:00 AM');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Trap Queen', @fettyWap_artistID, 'Fetty Wap(Deluxe)');

INSERT INTO Song(song_name, artist_id, album)
VALUES('679', @fettyWap_artistID, 'Fetty Wap(Deluxe)');

INSERT INTO Song(song_name, artist_id, album)
VALUES('KEKE', @fettyWap_artistID, 'Fetty Wap(Deluxe)');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Tripping Baby', @fettyWap_artistID, 'Fetty Wap(Deluxe)');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Swalla', @jasonDerulo_artistID, 'Swalla');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Jalebi Baby', @jasonDerulo_artistID, 'hes all that');

INSERT INTO Song(song_name, artist_id, album)
VALUES('take you dancing ', @jasonDerulo_artistID, 'take you dancing');

INSERT INTO Song(song_name, artist_id, album)
VALUES('get ugly', @jasonDerulo_artistID, 'everything is 4');

INSERT INTO Song(song_name, artist_id, album)
VALUES('ayo girl ', @jasonDerulo_artistID, 'ayo girl');

INSERT INTO Song(song_name, artist_id, album)
VALUES('want to want me ', @jasonDerulo_artistID, 'everything is 4');

INSERT INTO Song(song_name, artist_id, album)
VALUES('rule britannia', @agustd_artistID, 'ill remember you');

INSERT INTO Song(song_name, artist_id, album)
VALUES('well meet again', @agustd_artistID, 'ill remember you');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Snooze', @agustd_artistID, 'D-Day');

INSERT INTO Song(song_name, artist_id, album)
VALUES('SDL', @agustd_artistID, 'D-Day');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Interlude:Dawn', @agustd_artistID, 'D-Day');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Duma Dum', @agustd_artistID, 'D-Day');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Once dance', @drake_artistID, 'Views');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Gods Plan', @drake_artistID, 'Scorpion');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Hotline Bling', @drake_artistID, 'Views');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Spin Bout U', @drake_artistID, 'Her Loss');

INSERT INTO Song(song_name, artist_id, album)
VALUES('In My Feelings', @drake_artistID, 'Scorpion');

INSERT INTO Song(song_name, artist_id, album)
VALUES('America has a problem',  @beyonce_artistID, 'Renaissance');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Crazy in love',  @beyonce_artistID, 'Dangerously in Love');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Halo', @drake_artistID, 'I am ... Sasha Fierce');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Single ladies',  @beyonce_artistID, 'I am ... Sasha Fierce');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Partition',  @beyonce_artistID, 'Beyonce');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Break My Soul',  @beyonce_artistID, 'Renaissance');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Run My World',  @beyonce_artistID, '4');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Waka Waka', @shakira_artistID, 'Sale el Sol');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Whenever, Wherever', @shakira_artistID, 'Laundry Service');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Chantaje', @shakira_artistID, '2016');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Cant Remeber to Forget You', @shakira_artistID, 'Shakira');

INSERT INTO Song(song_name, artist_id, album)
VALUES('La La La ', @shakira_artistID, 'Shakira');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Try Everything', @shakira_artistID, 'Zootopia');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Special',@lizzo_artistID, 'Special');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Truth Hurts' ,@lizzo_artistID, 'Cuz I love You');

INSERT INTO Song(song_name, artist_id, album)
VALUES('2 be loved',@lizzo_artistID, 'Special');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Good as Hell',@lizzo_artistID, 'Cuz I love You');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Juice',@lizzo_artistID, 'Cuz I love You');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Boys',@lizzo_artistID, 'Cuz I love You');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Side to Side',@arianaGrande_artistID, 'Dangerous Woman');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Bang Bang ',@arianaGrande_artistID, 'My Everything');

INSERT INTO Song(song_name, artist_id, album)
VALUES('Into You',@arianaGrande_artistID, 'Dangerous Woman');

INSERT INTO Song(song_name, artist_id, album)
VALUES('dangerous Woman',@arianaGrande_artistID, 'Dangerous Woman');

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

USE tours

CREATE LOGIN neha
WITH PASSWORD = 'tourconcert';
CREATE USER neha
FOR LOGIN neha;

USE tours

GO
ALTER TABLE Song
ADD CONSTRAINT unique_songnames
UNIQUE(song_name)

GO

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
