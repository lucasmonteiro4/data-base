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


------------------------------------------------------
--     PART 3 : Initial exploration of the database --
------------------------------------------------------

select count(*) from comment_;  -- number of comment_ rows : 4 234 970				

select count(*) from author_;   -- number of author_ rows : 570 735

select count(*) from parent_;   -- number of parent_ rows : 1 464 558

select count(*) from score_;    -- number of score_ rows 4 234 970 
select count(*) from depends_;  -- number of depends_ rows : 4 234 970 
select count(*) from is_distinguished_;     -- number of is_distinguished_ rows : 4 234 970 

select max(score) from score_;  -- maximal score : 6761


select id
        , date(max(created_utc), 'unixepoch') as max_date   -- maximal date : 2015-05-31
        , body 
from comment_;

select id
        , date(min(created_utc), 'unixepoch') as min_date   -- minimal date : 2015-05-31
        , body 
from comment_;

select count(*) as nb_posts 
from comment_ c 
group by c.controversiality;
