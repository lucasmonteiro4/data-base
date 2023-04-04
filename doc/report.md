# Report Data Base

## Part 1

### Setup and preparation

The project can be found in the git repository https://github.com/lucasmonteiro4/data-base.git

Architecture of the project is as follow :

```
data_base/
    - data/
        - tables/
        - clean_tables/
        - data_dictionary
    - logic/
        - script.sql
        - py_script/
    - doc/
        - report.md
    project.db
    README.me
```

The data are not in the repo since it is to heavy to store it in the GitHub repository. Hence, data have to be placed in the folder **data/tables/**. 

We clone the git repository and we select it as current directory.

```shell
$ git clone https://github.com/lucasmonteiro4/data-base.git data_base
$ cd data_base
```

### Database creation

We create the database (*project.db*) in the **data_base/** folder

```shell
$ sqlite3 "project.db"
```

We execute the SQL file *script_part1.sql* (in the folder **logic/**) to create the schema and the tables.

```sql
.cd logic
.read script_part1.sql
.tables
```

## Part 2

### Data changes

We operate some changes on the data to clean and remove headers. We execute 2 python scripts.

The first one concerns the cleaning of the file *comment.csv*. In the field body, there are many line breaks and they have to be removed to allows SQLite to read comment.csv properly.

```python
# take comment.csv
# convert it as .txt
# replace 'subreddit_id' with 'subreddit_id \n'
# write as .csv

import csv

# open comment.csv
with open('askreddit_comment.csv', 'r') as f:
    content = f.read()

# change format to .txt (to apply string method with python)
with open('askreddit_comment.txt', 'w') as f:
    f.write(content)

# open the comment.txt
with open('askreddit_comment.txt', 'r') as f:
    txt_content = f.read()

# we constraint the line break to be after the subreddit_id
# subreddit_id is unique since the project is about one subreddit (AskReddit)
# hence we can use this unique string (subreddit_id) to enforce the line break
clean_content = txt_content.replace('subreddit_id ', 'subreddit_id \n')
clean_content = clean_content.replace('t5_2qh1i ', 't5_2qh1i \n')

# we finally write the clean file into a csv file into data/tables/
with open('clean_comment.csv', 'w') as f:
    f.write(clean_content)
```

The second python script concerns the removing to the header. When we have created the schema in the Part 1, we have created names for the columns. Hence, when we will import the data, the first row of each table will be the header in the .csv, we have to remove. (It surely exists another method, more efficient, but we did not find it.)

Here is an example for the table *askreddit_author.csv* ;

```python
# open the original file
with open("tables/askreddit_author.csv", "r") as f:

    # prepare to write the new clean file without header into the clean_tables/ folder
	with open("clean_tables/clean_author.csv", "w") as g:

        # do not consider the first row of the .csv when writing the new one
		next(f)

            # write all the following rows of the original .csv into the new clean .csv
			for line in f:
				g.write(line)
```

### Database loading

```sql
.cd ..
.mode csv
.separator ","

.cd data/clean_tables
.import clean_author.csv author_
.import clean_distinguihshed.csv distinguihshed_
.import clean_controverse.csv controversy_
.import clean_removal.csv removal_
.import clean_parent.csv parent_
.import clean_subreddit.csv subreddit_
.import clean_comment.csv comment_
.import clean_score.csv score_
.import clean_is_dist.csv is_distinguished_
.import clean_depends.csv depends_
```

```sql
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_author.csv author_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_distinguihshed.csv distinguihshed_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_controverse.csv controversy_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_removal.csv removal_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_parent.csv parent_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_subreddit.csv subreddit_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_comment.csv comment_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_score.csv score_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_is_dist.csv is_distinguished_
.import /home/use/Documents/dev/data_base/data/clean_tables/clean_depends.csv depends_

.headers on
```

## Part 3

```sql
select count(*) from comment_;  --4234971 (+1 car la première ligne est vide)					
```

```sql
select count(*) from comment_ where id != '';   --4234970 
```

un commentaire possède forcément un id donc une ligne vide (i.e. la première) possède forcément le champ vide id vide
source : https://stackoverflow.com/questions/50679272/how-do-i-count-the-rows-that-are-not-empty-with-group-by-in-pythons-sqlite3

-- get the number of authors (i.e. users)	
```sql	
select count(*) from author_;   --570735
```

```sql
select count(*) from parent_;   --1464558
```

get the number of score
```sql
select count(*) from score_;    --4234970 
```
number of comments and number of score matches : each comment has a corresponding score

```sql
select count(*) from depends_;  --4234970 
```

```sql
select count(*) from is_distinguished_;     --4234970 
```

```sql
select max(score) from score_;  --6761
```

## Part 4

Comment with highest score

```sql
select c.id, c.body, s_max.max_score 
from comment_ c, (select id as id_score, max(score) as max_score 
                    from score_) s_max 
where s_max.id_score = c.id;
```

| id      | body                                        | max_score |
|---------|---------------------------------------------|-----------|
| cr56nez | Then you got yourself a one night standoff. | 6761      |


Direct 
```sql
select a_c.* 
from (select author, count(author) as count_author 
        from comment_ 
        where author not in ('[deleted]', 'AutoModerator')  
        group by author) a_c 
order by a_c.count_author desc 
limit 5;
```

| author              | count_author |
|---------------------|--------------|
| Late_Night_Grumbler | 8298         |
| BiagioLargo         | 5843         |
| -_-Equinox666-_-    | 2989         |
| KubrickIsMyCopilot  | 2601         |
| Megaross            | 2479         |


Indirect (but long and heavy)

```sql
select a_c.* 
from (select author, count(author) as count_author 
        from comment_ 
        where author not in (select a_c.author 
                                from (select author, count(author) as count_author 
                                        from comment_ 
                                        group by author) a_c 
                                order by a_c.count_author desc limit 2)  
        group by author) a_c 
order by a_c.count_author desc 
limit 5;
```

| author              | count_author |
|---------------------|--------------|
| Late_Night_Grumbler | 8298         |
| BiagioLargo         | 5843         |
| -_-Equinox666-_-    | 2989         |
| KubrickIsMyCopilot  | 2601         |
| Megaross            | 2479         |



Average score of the one who commented the most

```sql
select round(avg(s.score),2), c.author 
from comment_ c, (select id as id_score, score 
                    from score_) s 
where c.id = s.id_score 
and c.author in (select a_c.author 
                    from (select author, count(author) as count_author 
                            from comment_ 
                            where author not in (select a_c.author 
                                                    from (select author, count(author) as count_author 
                                                            from comment_ 
                                                            group by author) a_c 
                                                    order by a_c.count_author desc limit 2)  
                            group by author) a_c 
                    order by a_c.count_author desc limit 1)
;
```

| avg_score | author              |
|-----------|---------------------|
| 4.75      | Late_Night_Grumbler |


Top 5 Authors with the highest average score

```sql
select author, avg(s.score) as avg_score 
from comment_ c, (select id as id_score, score 
                    from score_) s 
where c.id = s.id_score 
group by author 
order by avg_score desc 
limit 5;
```

| author              | avg_score |
|---------------------|-----------|
| lenaeca             | 5383.0    |
| CCorinne            | 4836.0    |
| The0isaZero         | 4834.0    |
| 4eyedoracle         | 4815.0    |
| planetoiletsscareme | 4755.0    |

Get the comment of the one who has the highest average score.

```sql
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
```

| id | body | author | score |
|---|---|---|---|
| crcgqnq | "You get really nervous, but you shouldn't be, because you teach statistics and no one really cares about statistics."    This was after my first semester as a Graduate teaching assistant. | lenaeca | 5383 |

### Controversiality

```sql
select * 
from comment_ 
where controversiality == 1 limit 3;
```

| id | body | author | controversiality |
|---|---|---|---|
| cqug921 | I honestly wouldn't have believed it if I didn't live it. She made his life hell  and I had a front row seat. I'm just glad I had a front row seat to her confession and firing. :) | youthfulvictim | 1 |
| cqug94y | The implications of that varies between cultures. Don't be racist. | robondes | 1 |
| cqug95f | You're just trying to get to the front page.  I see through your facade!!! | JustMe80 | 1 |

Count number of controversial and non-controversial posts

```sql
select count(*) as nb_posts 
from comment_ c 
group by c.controversiality;
```
| | nb_posts  |
|-|-----------|
|''| 1         |
|controversiality = 0| 4182752   |
|controversiality = 1| 52218     |


Get average score of controversial posts against non controversial ones

```sql
select round(avg(s.score),2) as average_score 
from comment_ c, (select id, score from score_) s 
where c.id = s.id 
group by c.controversiality;
```

| | average_score  |
|-|-----------|
|controversiality = 0| 12.75   |
|controversiality = 1| 0.86     |

Get top 5 authors that are the most controversial (measured with the number of controversial posts)

```sql
select author, count(*) as count_author 
from comment_ 
where controversiality==1 
group by author 
order by count_author desc 
limit 5;
```

| author | count_author |
|:---:|:---:|
| [deleted] | 4685 |
| CorDeFerrum | 95 |
| AutoModerator | 92 |
| Megaross | 60 |
| berke_k | 58 |

To get rid off of *[deleted]* and *AutoModerator* (note that it is surprising to find *AutoModerator* in the controversial post, an explanation could be that *AutoModerator* posts many times and that some users could signal it as controversial; more generally we find also find *Megaross* and *KubrickIsMyCopilot*, who are also in the group of users who have the most posted):

```sql
select author, count(*) as count_author 
from comment_ 
where controversiality==1 
    and author not in ('[deleted]', 'AutoModerator')  
group by author 
order by count_author desc 
limit 5;
```

|       author       	| count_author 	|
|:------------------:	|--------------	|
| CorDeFerrum        	| 95           	|
| Megaross           	| 60           	|
| berke_k            	| 58           	|
| KubrickIsMyCopilot 	| 57           	|
| -_-Equinox666-_-      | 49            |

## Part 5

## Documentation and resources
