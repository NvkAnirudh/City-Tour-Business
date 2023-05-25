--Part C
--5
create index rental_dvdid_index
on Rental (DVDId)

create index dvd_genre2_index
on DVD (GenreID)

create index dvd_rating2_index
on DVD (RatingId)

--listing the DVD titles and how many times each one has been rented. 
select temp.DVDTitle, temp.GenreName, temp.RatingName, count(temp.DVDId) as number_of_rentals
from 
(select d1.DVDId, d1.DVDTitle, g.GenreName, rt.RatingName
from dbo.DVD as d1 join 
dbo.Rental as r on d1.DVDId = r.DVDId join
dbo.Genre as g on d1.GenreId = g.GenreId join
dbo.Rating as rt on d1.RatingId = rt.RatingId) as temp
--Using group by on below attributes and order by in descending form to get highest number of rentals
group by temp.DVDId, temp.DVDTitle, temp.GenreName, temp.RatingName
order by count(temp.DVDId) DESC