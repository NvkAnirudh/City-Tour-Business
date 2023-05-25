--Part C
--3
create index dvd_genre_index
on DVD (GenreID)
drop index DVD.dvd_genre_index

create index dvd_rating_index
on DVD (RatingId)
drop index DVD.dvd_rating_index

create unique clustered index view_index_genre
on dbo.DVDView2(DVDId)

create nonclustered index view_index_genre
on dbo.DVDView2(Genre)

create nonclustered index view_index_rating
on dbo.DVDView2(Rating)

CREATE VIEW DVDView2 
with schemabinding AS 
		SELECT DVDId, DVDTitle, Genre.GenreName AS Genre, 
			Rating.RatingName AS Rating
		FROM dbo.DVD 
JOIN dbo.Genre ON DVD.GenreId = Genre.GenreId
JOIN dbo.Rating ON DVD.RatingId = Rating.RatingId;

drop view DVDView2
select top 5 * from DVDView2
 
SELECT * FROM DVDView2 WHERE Genre = 'Horror' AND Rating = 'R';