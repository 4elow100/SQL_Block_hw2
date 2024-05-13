create table if not exists GenresList (
	id SERIAL primary key,
	name varchar(80)
);

create table if not exists ArtistsList (
	id SERIAL primary key,
	name varchar(80)
);

create table if not exists GenresArtists (
	genre_id integer references GenresList(id),
	artist_id integer references ArtistsList(id),
	primary key (genre_id, artist_id)
);

create table if not exists AlbumsList (
	id SERIAL primary key,
	release_year integer,
	name varchar(80)
);

create table if not exists AlbumsArtists (
	album_id integer references AlbumsList(id),
	artist_id integer references ArtistsList(id),
	primary key (album_id, artist_id)
);

create table if not exists TracksList (
	id SERIAL primary key,
	album_id integer,
	duration time,
	name varchar(80),
	foreign key (album_id) references AlbumsList(id)
);

create table if not exists CollectionsList (
	id SERIAL primary key,
	release_year integer,
	name varchar(80)
);

create table if not exists CollectionsTracks (
	collection_id integer references CollectionsList(id),
	track_id integer references TracksList(id),
	primary key (collection_id, track_id)
);