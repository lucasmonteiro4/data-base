# Chérif YAKER & Lucas MONTEIRO
# M2 STAT - ECO - TSE
# Python script for data base project



# AUTHOR data
# open the original file
with open("data/raw/askreddit_author.csv", "r") as f:

	# prepare to write the new clean file without header into the cleaned/ folder
	with open("data/cleaned/clean_author.csv", "w") as g:

		# do not consider the first row of the .csv when writing the new one
		next(f)

		# write all the following rows of the original .csv into the new clean .csv
		for line in f:
			g.write(line)



# DISTINGUISHED data
with open("data/raw/askreddit_distinguihshed.csv", "r") as f:
	with open("data/cleaned/clean_distinguihshed.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# CONTROVERSE data
with open("data/raw/askreddit_controverse.csv", "r") as f:
	with open("data/cleaned/clean_controverse.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# PARENT data
with open("data/raw/askreddit_parent.csv", "r") as f:
	with open("data/cleaned/clean_parent.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# REMOVAL data
with open("data/raw/askreddit_removal.csv", "r") as f:
	with open("data/cleaned/clean_removal.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# COMMENT data
with open("data/raw/worked_comment.csv", "r") as f:
	with open("data/cleaned/clean_comment.csv", "w") as g:
		next(f)
		next(f) #for comment we also next the second line since it is blank
		for line in f:
			g.write(line)

# SCORE data
with open("data/raw/askreddit_score.csv", "r") as f:
	with open("data/cleaned/clean_score.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# DEPENDS data
with open("data/raw/askreddit_depends.csv", "r") as f:
	with open("data/cleaned/clean_depends.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# IS DISTINGUISHED data
with open("data/raw/askreddit_is_distinguihshed.csv", "r") as f:
	with open("data/cleaned/clean_is_dist.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# SUBREDDIT data
with open("data/raw/askreddit_subreddit.csv", "r") as f:
	with open("data/cleaned/clean_subreddit.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)