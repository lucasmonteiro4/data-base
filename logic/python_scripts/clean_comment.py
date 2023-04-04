# Chérif YAKER & Lucas MONTEIRO
# M2 STAT - ECO - TSE
# Python script for data base project
# clean the comment.csv file : problem with line breaks : SQLite cannot read properly the different rows/columns
# in this script : we rewrite the comment.csv as comment.txt : it create a long unique string 
#                   then we manually create the line break with the field subreddit_id : 
#                       since it is unique (same subreddit_id), we use it as criterion


# take comment.csv
# convert it as .txt
# replace subreddit_id with subreddit_id \n
# write as .csv


### thi script has to be run at the data_base folder level

import csv

with open('data/tables1/askreddit_comment.csv', 'r') as f:
    content = f.read()

with open('data/tables1/askreddit_comment.txt', 'w') as f:
    f.write(content)

with open('data/tables1/askreddit_comment.txt', 'r') as f:
    txt_content = f.read()

clean_content = txt_content.replace('subreddit_id ', 'subreddit_id \n')
clean_content = clean_content.replace('t5_2qh1i ', 't5_2qh1i \n')

with open('data/tables1/worked_comment.csv', 'w') as f:
    f.write(clean_content)
