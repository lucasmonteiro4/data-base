# Data base


**Authors : Chérif YAKER & Lucas MONTEIRO**

*Date : 02/04/2023*       

## Table of contents
1. [Setup](#setup)
2. [Project initialisation](#init)
3. [Documentation](#init)



## 1. Setup <a name="setup"></a>

We use **sqlite** since it is easier to use than Oracle (light, open-source and more pratical).

All the project can be found in a git repository posted on GitHub and can be imported with 

> git clone https://github.com/lucasmonteiro4/data-base.git data-base

The project is decomposed as follow :

```
data-base
        > data
        > doc
           > init.md
           > part1.md
           > part2.md
        > logic
           > part1.sql
           > part2.sql
```


On Windows, we set the current directory into K:/Documents and then we put the project data-base (for university computers).
On Linux, we set the current directory into ~/Documents and then we put the project data-base.

See below for the executed command lines for directory initialisation on Linux.

## 2. Project initialisation <a name="init"></a>

Our personal computer runs on Fedora Workstation 37.

### SQLite

We have first installed sqlite3 from the documentation https://developer.fedoraproject.org/tech/database/sqlite/about.html  

        $ sudo dnf install sqlite


### Environment

We select the working directory (dev file in our computer) and insert the data-base.git repository into it :

        $ cd Documents/dev
        $ git clone https://github.com/lucasmonteiro4/data-base.git data-base
        $ cd data-base
        $ sqlite3


## 3. Documentation <a name="doc"></a>

> https://www.sqlite.org/datatype3.html

> https://www.sqlite.org/lang_createtable.html

> https://www.sqlitetutorial.net/sqlite-create-table/

