extends CanvasLayer

func _ready():
	pass


func update_score(score):
	$ScoreLabel.text = str(score)


func update_streak(streak):
	$StreakLabel.text = "x " + str(streak)


func update_time(time):
	$TimeLabel.text = str(time) + "s"
