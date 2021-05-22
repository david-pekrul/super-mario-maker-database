/* Foreign Keys */
alter table courses
	add constraint courses_fk_player
		foreign key(player_id) 
		references players(player_id);

alter table plays
    add constraint plays_fk_player
		foreign key(player_id) 
		references players(player_id);
alter table plays	
    add constraint plays_fk_course
		foreign key (course_id)
		references courses(course_id);   

alter table clears
	add constraint clears_fk_player
		foreign key(player_id) 
		references players(player_id);
alter table clears         
	add constraint clears_fk_course
		foreign key (course_id)
		references courses(course_id);

alter table likes
	add constraint likes_fk_player
		foreign key(player_id) 
		references players(player_id);
alter table likes        
	add constraint likes_fk_course
		foreign key (course_id)
		references courses(course_id);

alter table records
	add constraint records_fk_player
		foreign key(player_id) 
		references players(player_id);
alter table records	
    add constraint records_fk_course
		foreign key (course_id)
		references courses(course_id);  

alter table course_meta
	add constraint meta_fk_player
		foreign key(first_clear_player_id) 
		references players(player_id);
alter table course_meta        
	add constraint meta_fk_course
		foreign key (course_id)
		references courses(course_id);



/* Update catch timestamps */

update plays
set catch = to_timestamp(catch_import,'YYYY-MM-DD HH24:MI:SS.MS')
where catch is null
and catch_import is not null;

update likes
set catch = to_timestamp(catch_import,'YYYY-MM-DD HH24:MI:SS.MS')
where catch is null
and catch_import is not null;

update clears
set catch = to_timestamp(catch_import,'YYYY-MM-DD HH24:MI:SS.MS')
where catch is null
and catch_import is not null;

update records
set catch = to_timestamp(catch_import,'YYYY-MM-DD HH24:MI:SS.MS')
where catch is null
and catch_import is not null;

update course_meta
set catch = to_timestamp(catch_import,'YYYY-MM-DD HH24:MI:SS.MS')
where catch is null
and catch_import is not null;


/* Drop import column */
alter table plays drop column catch_import;
alter table likes drop column catch_import;
alter table clears drop column catch_import;
alter table records drop column catch_import;
alter table course_meta drop column catch_import;