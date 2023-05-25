--Part c
--2)
create index dvdid_rental
on Rental (DVDId)

SELECT DVDTitle AS 'DVD Title'
		FROM DVD 
		WHERE DVDId NOT IN 
			(SELECT DISTINCT DVDId FROM Rental WHERE MemberId = 123);

drop index Rental.dvdid_rental
