# take comment.csv
# convert it as .txt
# replace subreddit_id with subreddit_id \n
# write as .csv

import csv

with open('askreddit_comment.csv', 'r') as f:
    content = f.read()

with open('askreddit_comment.txt', 'w') as f:
    f.write(content)

with open('askreddit_comment.txt', 'r') as f:
    txt_content = f.read()

clean_content = txt_content.replace('subreddit_id ', 'subreddit_id \n')
clean_content = clean_content.replace('t5_2qh1i ', 't5_2qh1i \n')

with open('clean_comment.csv', 'w') as f:
    f.write(clean_content)