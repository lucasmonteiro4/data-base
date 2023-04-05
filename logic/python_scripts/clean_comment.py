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


### this script has to be run at the data_base folder level

import csv

# open comment.csv
with open('data/raw/askreddit_comment.csv', 'r') as f:
    content = f.read()

# change format to .txt (to apply string method with python), this will remove all line breaks
with open('data/raw/askreddit_comment.txt', 'w') as f:
    f.write(content)

# open the comment.txt
with open('data/raw/askreddit_comment.txt', 'r') as f:
    txt_content = f.read()

# we constraint the line break to be after the subreddit_id
# subreddit_id is unique since the project is about one subreddit (AskReddit)
# hence we can use this unique string (subreddit_id) to enforce the line break
clean_content = txt_content.replace('subreddit_id ', 'subreddit_id \n')
clean_content = clean_content.replace('t5_2qh1i ', 't5_2qh1i \n')

# we finally write the clean file into a csv file into data/raw/
with open('data/raw/worked_comment.csv', 'w') as f:
    f.write(clean_content)
