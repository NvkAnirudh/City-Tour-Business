--Part c
--1)
SELECT DVD.DVDTitle AS "DVD Title",  
		SUBSTRING(MoviePerson.PersonFirstName,1,10) + ' ' +
		SUBSTRING(MoviePerson.PersonLastName,1,10) AS "DirectorName"
FROM DVD
JOIN MoviePersonRole ON DVD.DVDId = MoviePersonRole.DVDId
JOIN Role ON MoviePersonRole.RoleId = Role.RoleId
JOIN MoviePerson ON MoviePersonRole.PersonId = MoviePerson.PersonId
WHERE 
Role.RoleName = 'Director'
		AND ((MoviePerson.PersonLastName = 'Spielberg') 
		     OR 
(MoviePerson.PersonLastName = 'Hitchcock' AND MoviePerson.PersonFirstName = 'Alfred'))
ORDER BY MoviePerson.PersonLastName, MoviePerson.PersonFirstName;
--order by DirectorName;

--Updated Cost Effective Query

--Justification: In the old query since we are adding a where clause that helps to output only the filtered Movie People, the whole MoviePerson table is being scanned
--once (which contains around 3300 records). Since the whole table is being scanned the CPU cost rose to 37% and the filter is not even required for the question asked.
--Therefore we can just remove the filter so that the whole MoviePerson table need not be scanned

SELECT DVD.DVDTitle AS "DVD Title",  
		SUBSTRING(MoviePerson.PersonFirstName,1,10) + ' ' +
		SUBSTRING(MoviePerson.PersonLastName,1,10) AS "Director Name"
FROM DVD
JOIN MoviePersonRole ON DVD.DVDId = MoviePersonRole.DVDId
JOIN Role ON MoviePersonRole.RoleId = Role.RoleId
JOIN MoviePerson ON MoviePersonRole.PersonId = MoviePerson.PersonId
WHERE 
Role.RoleName = 'Director'
ORDER BY MoviePerson.PersonLastName, MoviePerson.PersonFirstName;


--Update 2
SELECT DVD.DVDTitle AS "DVDTitle",  
		SUBSTRING(MoviePerson.PersonFirstName,1,10) + ' ' +
		SUBSTRING(MoviePerson.PersonLastName,1,10) AS "DirectorName"
FROM DVD
JOIN MoviePersonRole ON DVD.DVDId = MoviePersonRole.DVDId
JOIN Role ON MoviePersonRole.RoleId = Role.RoleId
JOIN MoviePerson ON MoviePersonRole.PersonId = MoviePerson.PersonId
WHERE  
Role.RoleName = 'Director' and MoviePerson.PersonLastName = 'Spielberg'
union
SELECT DVD.DVDTitle AS "DVDTitle",  
		SUBSTRING(MoviePerson.PersonFirstName,1,10) + ' ' +
		SUBSTRING(MoviePerson.PersonLastName,1,10) AS "DirectorName"
FROM DVD
JOIN MoviePersonRole ON DVD.DVDId = MoviePersonRole.DVDId
JOIN Role ON MoviePersonRole.RoleId = Role.RoleId
JOIN MoviePerson ON MoviePersonRole.PersonId = MoviePerson.PersonId
WHERE  
Role.RoleName = 'Director' and (MoviePerson.PersonLastName = 'Hitchcock' AND MoviePerson.PersonFirstName = 'Alfred')
--ORDER BY MoviePerson.PersonLastName, MoviePerson.PersonFirstName;
--order by DirectorName;
