extends Node

var score_file = "user://highscore.save"

func save_score(highscore):
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_var(highscore)
	file.close()

func load_score():
	var file = File.new()
	var highscore = 0
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		highscore = file.get_var()
		file.close()
	return highscore
