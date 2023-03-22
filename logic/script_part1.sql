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

-- we indicate table with an underscore _ at the end : table_ 


-- these statements are used to avoid the problem of rewriting the tables
-- we drop in the inverse order (because of relationships and keys)
drop table if exists removed_ ;
drop table if exists depends_ ;
drop table if exists is_distinguished_ ;
drop table if exists score_ ;
drop table if exists comment_ ;
drop table if exists subreddit_ ;
drop table if exists parent_ ;
drop table if exists removal_ ;
drop table if exists controversy_ ;
drop table if exists distinguished_ ;
drop table if exists author_ ;

-- we first create tables with only primary keys (to further create related tables with foreign keys)

---- AUTHOR($author : _string_)
create table author_ (
	author TEXT
	, PRIMARY KEY (author)
);



---- DISTINGUISHED($distinguished : _string_)
create table distinguished_ (
	distinguished TEXT
	, PRIMARY KEY (distinguished)
);



---- CONTROVERSY($controversiality : _integer_)
create table controversy_ (
	controversiality INTEGER CHECK ((controversiality == 0) or (controversiality == 1))
	, PRIMARY KEY (controversiality)
);



---- REMOVAL($removal_reason : _string_)
create table removal_ (
	removal_reason TEXT
	, PRIMARY KEY (removal_reason)
);



---- PARENT($parent_id : _string_
----       , link_id : _string_)
create table parent_ (
	parent_id TEXT
	, link_id TEXT
	, PRIMARY KEY (parent_id)
);


---- SUBREDDIT($subreddit_id : _string_
----          , subreddit : _string_)
create table subreddit_ (
	subreddit_id TEXT
	, subreddit TEXT
	, PRIMARY KEY (subreddit_id)
);


-- We choose the following relationship : comment_ : $id and score_ : (id#)
-- So comment_ as to be defined first and score_ second

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

create table comment_ (
	id TEXT 
	, created_utc INTEGER
	, name TEXT
	, body TEXT
	, edited INTEGER 
	, author_flair_css_class TEXT
	, author_flair_text TEXT
	, author TEXT
	, controversiality INTEGER
	, subreddit_id TEXT

	, PRIMARY KEY (id) 
	, FOREIGN KEY (author) REFERENCES author_ (author)
	, FOREIGN KEY (controversiality) REFERENCES controversy_ (controversiality)
	, FOREIGN KEY (subreddit_id) REFERENCES subreddit_ (subreddit_id)
);


---- SCORE($id# : _string_
----        , score : _integer_
----        , ups : _integer_
----        , downs : _integer_
----        , score_hidden : _boolean_
----        , gilded : _integer_)
create table score_ (
	id TEXT
	, score INTEGER
	, ups INTEGER
	, downs INTEGER

    -- no native boolean type : see https://www.sqlite.org/datatype3.html > 2.1 Boolean Datatype
    , score_hidden INTEGER check ((score_hidden == 0) or (score_hidden == 1))
	, gilded INTEGER
	, PRIMARY KEY (id)
	, FOREIGN KEY (id) REFERENCES comment_(id)
);



---- IS_DITINGUISHED($id# : _string_
----        , $distinguished# : _string_)
create table is_distinguished_ (
	id TEXT 
	, distinguished TEXT 

	, PRIMARY KEY (id, distinguished)	
	, FOREIGN KEY (id) REFERENCES comment_ (id)
	, FOREIGN KEY (distinguished) REFERENCES distinguished_ (distinguished)
);


---- REMOVED($id# : _string_
----        , $removal_reason# : _string_)
create table removed_ (
	id TEXT 
	, removal_reason TEXT 

	, PRIMARY KEY (id, removal_reason)
	, FOREIGN KEY (id) REFERENCES comment_ (id)
	, FOREIGN KEY (removal_reason) REFERENCES removal_ (removal_reason)
);


---- DEPENDS($id# : _string_
----        , $parent_id# : _string_)
create table depends_ (
	id TEXT 
	, parent_id TEXT 

	, PRIMARY KEY (id, parent_id)
	, FOREIGN KEY (id) REFERENCES comment_ (id)
	, FOREIGN KEY (parent_id) REFERENCES parent_ (parent_id)
);