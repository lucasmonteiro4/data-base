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

-- for each table, we indicate its columns and their respective data types
-- for primary key, we indicate it with a dollar sign $ at the beginning
-- for foreign key, we indicate it with a hashtag sign # at the end

---- AUTHOR($author : _string_)
create table author_ (
	author TEXT,
    PRIMARY KEY (author)
);



---- DISTINGUISHED($distinguished : _string_)
create table distinguished_ (
	distinguished TEXT,
	PRIMARY KEY (distinguished)
);



---- CONTROVERSY($controversiality : _integer_)
create table controversy_ (
	controversiality INTEGER,   
	PRIMARY KEY (controversiality)
);



---- REMOVAL($removal_reason : _string_)
create table removal_ (
	removal_reason TEXT,
	PRIMARY KEY (removal_reason)
);



---- SCORE($id# : _string_
----        , score : _integer_
----        , ups : _integer_
----        , downs : _integer_
----        , score_hidden : _boolean_
----        , gilded : _integer_)
create table score_ (
	--columns
	id TEXT,
    score INTEGER,
    ups INTEGER,
    downs INTEGER,
    -- no native boolean type : see https://www.sqlite.org/datatype3.html > 2.1 Boolean Datatype
    score_hidden INTEGER,
    gilded INTEGER,
	
	-- constraints (pk)
	constraint pk_removal primary key (removal_reason)
);



---- PARENT($parent_id : _string_
----        , link_id : __)



---- SUBREDDIT($subreddit_id : _string_
----        , subreddit : _string_)



---- COMMENT($id : _string_
----        , created_utc : _long_integer_
----        , name : _string_
----        , body : _string_
----        , edited : _long_integer_
----        , author_flair_css_class : _string_
----        , author_flair_text : _string_
----        , author# : _string_
----        , controversiality# : _integer_
----        , subreddit_id# : _string_)



---- IS_DITINGUISHED($id# : _string_
----        , $distinguished# : _string_)



---- REMOVED($id# : _string_
----        , $removal_reason# : _string_)



---- DEPENDS($id# : _string_
----        , $parent_id# : _string_)



