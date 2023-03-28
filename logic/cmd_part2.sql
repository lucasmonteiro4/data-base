--------------------------------------------------
--              DATA BASES PROJECT              --
--                                              --
--               M2 STATS ECO TSE               --
--                                              --
--  Authors : Chérif YAKER & Lucas MONTEIRO     --
--                                              --
--              Date : 02/04/2023               --
--                                              --
--------------------------------------------------


--------------------------------------------------
--     PART 1 : Creating the database           --
--     Sources : schema and data dictionary     --
--------------------------------------------------

.cd logic
.read script_part1.sql
.tables

--------------------------------------------------
--     PART 2 : Loading the database            --
--     Sources : csv data                       --
--------------------------------------------------
		
.mode csv
.separator ","

.import /home/use/Documents/dev/data_base/data/clean_tables/clean_author.csv author_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_distinguihshed.csv distinguihshed_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_controverse.csv controversy_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_removal.csv removal_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_parent.csv parent_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_subreddit.csv subreddit_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_comment.csv comment_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_score.csv score_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_is_dist.csv is_distinguished_
.import /home/use/Documments/dev/data_base/data/clean_tables/clean_depends.csv depends_

.headers on

--------------------------------------------------
--     PART 3 : Initial analysis                --
--------------------------------------------------

-- get the number of comments
select count(*) from comment_;
		--4234971 (+1 car la première ligne est vide)					

-- get the right number of comments
select count(*) from comment_ where id != '';
		--4234970 

		--un commentaire possède forcément un id donc une ligne vide (i.e. la première) possède forcément le champ vide id vide
		--source : https://stackoverflow.com/questions/50679272/how-do-i-count-the-rows-that-are-not-empty-with-group-by-in-pythons-sqlite3

-- get th number of authors (i.e. users)		
select count(*) from author_;
		--570735

select count(*) from parent_;
		--1464558

-- get the number of score
select count(*) from score_;
		--4234970 
-- number of comments and number of score matches : each comment has a corresponding score

select count(*) from depends_;
		--4234970 

select count(*) from is_distinguished_
		--4234970 

select max(score) from score_;
        --6761
-- 


--------------------------------------------------
--     PART 4 : Deeper analysis                 --
--------------------------------------------------

-- axe 1 : explore the comment the highest scores 

-- axe 2 : explore the authors who post the most 

-- axe 3 : explore the most famous subjects 

-- mixed : link the 3 previous axes (e.g. get the author who has the most posted and got the highest score)