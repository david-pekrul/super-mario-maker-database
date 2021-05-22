create table players (
	player_id varchar primary key,
	image varchar,
	flag varchar,
	name varchar
);

create table courses (
	course_id varchar primary key,
	player_id varchar,
	difficulty varchar not null,
	game_style varchar not null,
	title varchar,
	thumbnail varchar not null,
	image varchar not null,
	creation timestamp, --nullable for import
	creation_import varchar

);

create table plays (
	course_id varchar not null,
	player_id varchar not null,
	catch timestamp, --nullable for import
	catch_import varchar not null
);

create table clears (
	course_id varchar not null,
	player_id varchar not null,
	catch timestamp, --nullable for import
	catch_import varchar not null
);

create table likes (
	course_id varchar not null,
	player_id varchar not null,
	catch timestamp, --nullable for import
	catch_import varchar not null
);

create table records (
	course_id varchar not null,
	player_id varchar not null,
	catch timestamp, --nullable for import
	catch_import varchar not null,
	record_time numeric not null
);

create table course_meta (
	course_id varchar not null,
	first_clear_player_id varchar,
	catch timestamp, --nullable for import
	catch_import varchar not null,
	tag varchar,
	stars numeric,
	players numeric,
	tweets numeric,
	clears numeric,
	attempts numeric,
	clear_rate numeric
);