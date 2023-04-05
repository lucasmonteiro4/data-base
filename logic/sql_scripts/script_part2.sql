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
--     PART 2 : Loading the database            --
--------------------------------------------------

-- first : indicate the nature of data we are going to import
.mode csv

-- second : indicate the separator in the csv files
.separator ","

-- third : import each cleaned data into its respective table in the database
.import data/cleaned/clean_author.csv author_
.import data/cleaned/clean_distinguihshed.csv distinguihshed_
.import data/cleaned/clean_controverse.csv controversy_
.import data/cleaned/clean_removal.csv removal_
.import data/cleaned/clean_parent.csv parent_
.import data/cleaned/clean_subreddit.csv subreddit_
.import data/cleaned/clean_comment.csv comment_
.import data/cleaned/clean_score.csv score_
.import data/cleaned/clean_is_dist.csv is_distinguished_
.import data/cleaned/clean_depends.csv depends_

-- fourth : activate the headers for a better readability hereafter 
.headers on
