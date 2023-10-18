CREATE TABLE public.artists (
	artistid varchar(400) NOT NULL,
	name varchar(400),
	location varchar(400),
	lattitude numeric(18,0),
	longitude numeric(18,0)
);

CREATE TABLE public.songplays (
	playid varchar(32) NOT NULL,
	start_time timestamp NOT NULL,
	userid int4 NOT NULL,
	"level" varchar(400),
	songid varchar(400),
	artistid varchar(400),
	sessionid int4,
	location varchar(400),
	user_agent varchar(400),
	CONSTRAINT songplays_pkey PRIMARY KEY (playid)
);

CREATE TABLE public.songs (
	songid varchar(400) NOT NULL,
	title varchar(400),
	artistid varchar(400),
	"year" int4,
	duration numeric(18,0),
	CONSTRAINT songs_pkey PRIMARY KEY (songid)
);

CREATE TABLE public.staging_events (
	artist varchar(400),
	auth varchar(400),
	firstName varchar(400),
	gender varchar(400),
	itemInSession int4,
	lastName varchar(400),
	length numeric(18,0),
	"level" varchar(400),
	location varchar(400),
	"method" varchar(400),
	page varchar(400),
	registration numeric(18,0),
	sessionId int4,
	song varchar(400),
	status int4,
	ts int8,
	userAgent varchar(400),
	userId int4
);

CREATE TABLE public.staging_songs (
	num_songs int4,
	artist_id varchar(400),
	artist_name varchar(400),
	artist_latitude numeric(18,0),
	artist_longitude numeric(18,0),
	artist_location varchar(400),
	song_id varchar(400),
	title varchar(400),
	duration numeric(18,0),
	"year" int4
);

CREATE TABLE public."time" (
	start_time timestamp NOT NULL,
	"hour" int4,
	"day" int4,
	week int4,
	"month" varchar(400),
	"year" int4,
	weekday varchar(400),
	CONSTRAINT time_pkey PRIMARY KEY (start_time)
) ;

CREATE TABLE public.users (
	userid int4 NOT NULL,
	first_name varchar(400),
	last_name varchar(400),
	gender varchar(400),
	"level" varchar(400),
	CONSTRAINT users_pkey PRIMARY KEY (userid)
);
