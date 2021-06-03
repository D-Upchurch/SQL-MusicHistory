--Query all of the entries in the Genre table

/*
Select * from Genre;
*/

--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

/*
Select * from Artist
Order By Artist.ArtistName;
*/

--Write a SELECT query that lists all the songs in the Song table and include the Artist name

/*
Select s.Title,
	   a.ArtistName
	From Song s Left Join Artist a on s.ArtistId = a.id;
*/

--Write a SELECT query that lists all the Artists that have a Pop Album

/*
Select Distinct a.ArtistName
from Song s Left Join Artist a on s.ArtistId = a.id Left Join Genre g on s.GenreId = g.Id
Where g.Id = 7;
*/

--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

/*
Select Distinct a.ArtistName
from Album al Left Join Artist a on al.ArtistId = a.id Left Join Genre g on al.GenreId = g.Id
Where g.Id = 4 OR g.Id = 2;
*/

--Write a SELECT statement that lists the Albums with no songs

/*
Select Distinct al.Title
from Album al Left Join Song s on s.AlbumId = al.Id
Where s.Title is Null;
*/

--Using the INSERT statement, add one of your favorite artists to the Artist table.

/*
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Tool', 1990);
*/

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

/*
insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ('Fear Inoculum', 08/30/2019, 4750, 'RCA Records', 29, 2);
*/

--Using the INSERT statement, add some songs that are on that album to the Song table.

/*
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Pneuma', 713, '08/30/2019', 2, 29, 23);
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Invincible', 764, '08/30/2019', 2, 29, 23);
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Descending', 817, '08/30/2019', 2, 29, 23);
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('7empest', 943, '08/30/2019', 2, 29, 23);
*/

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

/*
Select s.Title,
	  al.Title,
	   a.ArtistName
	from Song s Left Join Album al on s.AlbumId = al.Id Left Join Artist a on s.ArtistId = a.Id
	where al.Title = 'Fear Inoculum';
*/

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

/*
Select  al.Title,
		Count(al.Title) NumberSongs
from Song s Left Join Album al on s.AlbumId = al.Id
Group By al.Title;
*/

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

/*
Select  a.ArtistName,
		Count(a.ArtistName) NumberSongs
from Song s Left Join Artist a on s.ArtistId = a.Id
Group By a.ArtistName;
*/

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

/*
Select  g.Name,
		Count(g.Name) NumberSongs
from Song s Left Join Genre g on s.GenreId = g.Id
Group By g.Name;
*/

--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

/*
Select distinct a.ArtistName
from Album al Right Join Artist a on al.ArtistId = a.Id
Group by a.ArtistName
Having Count(distinct al.Label) > 1;
*/

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

/*
Select top 1 max(al.albumLength) as albumLength,
		al.Title
from Album al
Group by al.Title
Order by albumLength desc;
*/

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

/*
Select top 1 max(s.SongLength) as songLength,
			s.Title
from Song s
Group by s.Title
Order by songLength desc
*/

--Modify the previous query to also display the title of the album.

/*
Select top 1 max(s.SongLength) as songLength,
			s.Title,
			al.Title
from Song s Left Join Album al on s.AlbumId = al.Id
Group by s.Title, al.Title
Order by songLength desc
*/