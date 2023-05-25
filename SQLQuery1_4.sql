--Part C
--4
create index rental_memberid_index
on Rental (MemberId)

create index dvd_genre2_index
on DVD (GenreID)

create index dvd_rating2_index
on DVD (RatingId)

create index MPR_dvdid_index
on MoviePersonRole (DVDId)

create index MPR_roleid_index
on MoviePersonRole (RoleId)

select dvd.MEMBERNAME, d.DVDTITLE, d.DVDID, dvd.RentalRequestDate, dvd.RentalShippedDate, g.GenreName, rating.RatingName, ro.RoleName
from DVD as d join
--below select statment (subquery) is to get member names
(select m.MEMBERFIRSTNAME + ' ' + m.MEMBERLASTNAME AS MEMBERNAME, r.DVDID, r.RentalRequestDate, r.RentalShippedDate
from Member as m join
Rental as r on m.MemberId = r.MemberId
where r.RentalReturnedDate is NULL and r.RentalShippedDate is not NULL) as dvd on d.DVDID = dvd.DVDID join
GENRE as g on d.GENREID = g.GENREID join
RATING as rating on d.RATINGID = rating.RATINGID join
MOVIEPERSONROLE as mrole on d.DVDID = mrole.DVDID join
ROLE as ro on mrole.ROLEID = ro.ROLEID
where ro.RoleName = 'Director'

