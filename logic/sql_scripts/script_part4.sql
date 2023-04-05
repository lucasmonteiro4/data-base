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
--     PART 3 : Deep exploration of the database    --
------------------------------------------------------

-- comment with the highest score
select c.id
        , date(c.created_utc, 'unixepoch') as date_comment
        , c.body
        , s_max.max_score 
from comment_ c, (select id as id_score
                        , max(score) as max_score 
                    from score_) s_max 
where s_max.id_score = c.id;

-- authors with higher number of posts (without [deleted] and AutoModerator)
select a_c.* 
from (select author
            , count(author) as count_author 
        from comment_ 
        where author not in ('[deleted]', 'AutoModerator')  
        group by author) a_c 
order by a_c.count_author desc 
limit 5;

-- average score of the one who commented the most

select round(avg(s.score),2)
        , c.author 
from comment_ c, 
(select id as id_score
        , score 
    from score_) s 
where c.id = s.id_score 
and c.author in (select a_c.author 
                    from (select author
                                , count(author) as count_author 
                            from comment_ 
                            where author not in (select a_c.author 
                                                    from (select author
                                                                , count(author) as count_author 
                                                            from comment_ 
                                                            group by author) a_c 
                                                    order by a_c.count_author desc limit 2)  
                            group by author) a_c 
                    order by a_c.count_author desc limit 1)
;

-- top 5 authors with the highest average score

select author, avg(s.score) as avg_score 
from comment_ c, (select id as id_score, score 
                    from score_) s 
where c.id = s.id_score 
group by author 
order by avg_score desc 
limit 5;

-- comment of the one who has the highest average score.

select c.id, c.body, c.author, s.score 
from comment_ c, score_ s
where c.id = s.id
and author in (select ha.author 
                from (select author, avg(s.score) as avg_score 
                        from comment_ c, (select id as id_score, score from score_) s 
                        where c.id = s.id_score 
                        group by author 
                        order by avg_score desc 
                        limit 1) ha);

-- 3 controversial comments

select * 
from comment_ 
where controversiality == 1 
limit 3;

-- get average score of controversial posts against non controversial ones

select round(avg(s.score),2) as average_score 
from comment_ c, (select id, score from score_) s 
where c.id = s.id 
group by c.controversiality;

-- get top 5 authors that are the most controversial (measured with the number of controversial posts)

select author, count(*) as count_author 
from comment_ 
where controversiality==1 
group by author 
order by count_author desc 
limit 5;

-- same but without [deleted] and AutoModerator
select author, count(*) as count_author 
from comment_ 
where controversiality==1 
    and author not in ('[deleted]', 'AutoModerator')  
group by author 
order by count_author desc 
limit 5;