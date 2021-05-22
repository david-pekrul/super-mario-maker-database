SET PGPASSWORD=supermario
SET DB_HOST=localhost
SET USERNAME=supermario
SET SCHEMA=supermario

psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\drop_tables.sql"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\create_tables.sql"

psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY players(player_id, image, flag, name) FROM '%cd%\archive\players.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY courses(course_id, difficulty, game_style, player_id, title, thumbnail, image, creation_import) FROM '%cd%\archive\courses.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY plays(catch_import, course_id, player_id) FROM '%cd%\archive\plays.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY clears(catch_import, course_id, player_id) FROM '%cd%\archive\clears.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY likes(catch_import, course_id, player_id) FROM '%cd%\archive\likes.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY records(catch_import, course_id, player_id, record_time) FROM '%cd%\archive\records.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY course_meta(catch_import, course_id, first_clear_player_id, tag, stars, players, tweets, clears, attempts, clear_rate) FROM '%cd%\archive\course-meta.csv' WITH DELIMITER AS E'\t' NULL AS '' HEADER CSV;"

psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\post-import.sql"