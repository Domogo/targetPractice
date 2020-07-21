extends CanvasLayer


func _ready():
	pass

func update_score(score):
	$ScoreLabel.text = str(score)

func update_streak(streak):
	$StreakLabel.text = "x " + str(streak)

func update_time(time):
	$TimeLabel.text = str(time) + "s"

func hide():
	$ScoreLabel.visible = false
	$StreakLabel.visible = false
	$TimeLabel.visible = false

func show():
	$ScoreLabel.visible = true
	$StreakLabel.visible = true
	$TimeLabel.visible = true
