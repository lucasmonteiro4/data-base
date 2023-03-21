# Data base


**Authors : Chérif YAKER & Lucas MONTEIRO**

*Date : 02/04/2023*         

We use **sqlite** since it is easier to use than Oracle (open-source and more pratical).

### Documentation

> https://www.sqlite.org/datatype3.html

> https://www.sqlite.org/lang_createtable.html

> https://www.sqlitetutorial.net/sqlite-create-table/


### Architecture

data

doc > part1_doc

logic > part1_script

### Setup

windows : 

> K:\>cd "Documents/data_base"

> K:\Documents/data_base>dir

> K:\Documents/data_base>cd "sqlite-tools-win32-x86-3400100"

> K:\Documents/data_base/sqlite-tools-win32-x86-3400100>sqlite3

> sqlite> .quit


linux : 



##PART 1 : Creating the database
Sources : schema and data dictionary

for each table, we indicate its columns and their respective data types
- AUTHOR(author : _string_)

- DISTINGUISHED(distinguished : _string_)

- CONTROVERSY(controversiality : _integer_)

- REMOVAL(removal_reason : _string_)

- SCORE(id# : _string_
        , score : _integer_
        , ups : _integer_
        , downs : _integer_
        , score_hidden : _boolean_
        , gilded : _integer_)

- PARENT(parent_id : _string_
        , link_id : __)

- SUBREDDIT(subreddit_id : _string_
        , subreddit : _string_)

- COMMENT(id : _string_
        , created_utc : _long_integer_
        , name : _string_
        , body : _string_
        , edited : _long_integer_
        , author_flair_css_class : _string_
        , author_flair_text : _string_
        , author# : _string_
        , controversiality# : _integer_
        , subreddit_id# : _string_)

- IS_DITINGUISHED(id# : _string_
        , distinguished# : _string_)


- REMOVED(id# : _string_
       , removal_reason# : _string_)
- DEPENDS(id# : _string_
       , parent_id# : _string_)