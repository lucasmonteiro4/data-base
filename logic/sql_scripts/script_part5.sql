--------------------------------------------------
--              DATA BASE PROJECT              --
--                                              --
--               M2 STATS ECO TSE               --
--                                              --
--  Authors : Chérif YAKER & Lucas MONTEIRO     --
--                                              --
--              Date : 02/04/2023               --
--                                              --
--------------------------------------------------


--------------------------------------------------
--     PART 5 : Subseting the database          --
--------------------------------------------------

attach 'reduced.db' as red_db;

insert into red_db.comment_
select * from comment_ where id in (select id from comment_ order by random() limit 1000);


-- Score
insert into red_db.score_
select * from score_ where id in (select id from red_db.comment_);


-- Is Distinguished
insert into red_db.is_distinguished_
select * from is_distinguished_ where id in (select id from red_db.comment_);


-- Author
insert into red_db.score_
select * from score_ where id in (select id from red_db.comment_);



-- Distinguished
insert into red_db2.distinguished_
select * from distinguished_;


-- Controversy
insert into red_db.controversy_
select * from controversy_;


-- Subreddit 
insert into red_db.distinguished_
select * from distinguished_;