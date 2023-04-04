# Chérif YAKER & Lucas MONTEIRO
# M2 STAT - ECO - TSE
# Python script for data base project



# AUTHOR data
# open the original file
with open("data/tables1/askreddit_author.csv", "r") as f:
	with open("data/cleaned1/clean_author.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# DISTINGUISHED data
with open("data/tables1/askreddit_distinguihshed.csv", "r") as f:
	with open("data/cleaned1/clean_distinguihshed.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# CONTROVERSE data
with open("data/tables1/askreddit_controverse.csv", "r") as f:
	with open("data/cleaned1/clean_controverse.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# PARENT data
with open("data/tables1/askreddit_parent.csv", "r") as f:
	with open("data/cleaned1/clean_parent.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# REMOVAL data
with open("data/tables1/askreddit_removal.csv", "r") as f:
	with open("data/cleaned1/clean_removal.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# COMMENT data
with open("data/tables1/worked_comment.csv", "r") as f:
	with open("data/cleaned1/clean_comment.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# SCORE data
with open("data/tables1/askreddit_score.csv", "r") as f:
	with open("data/cleaned1/clean_score.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# DEPENDS data
with open("data/tables1/askreddit_depends.csv", "r") as f:
	with open("data/cleaned1/clean_depends.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

# IS DISTINGUISHED data
with open("data/tables1/askreddit_is_distinguihshed.csv", "r") as f:
	with open("data/cleaned1/clean_is_dist.csv", "w") as g:
		next(f)
		for line in f:
			g.write(line)

