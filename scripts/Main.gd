extends Node2D

var Crosshairs = preload("res://scenes/Crosshairs.tscn")
var crosshair = Crosshairs.instance()

var score = 0
var speed = 500
var perfect_streak = 0
var time = 0


func game_over():
	$SessionTimer.stop()
	queue_free()
	print("GAMEOVER")


func _ready():
	reset_on_start()
	$Target.prepare(get_viewport().size / 2)
	prepare_crosshair()
	$SessionTimer.start()


func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed:
		var points = $Target.hit_detection(crosshair)
		handle_points_and_update_HUD(points)
		prepare_crosshair()


func _process(_delta):
	if crosshair.is_off_screen():
		game_over()


func _on_SessionTimer_timeout():
	time += 1
	$HUD.update_time(time)
	update_speed()


# HELPER METHODS


func reset_on_start():
	score = 0
	time = 0
	perfect_streak = 0
	speed = 500
	$HUD.update_score(score)
	$HUD.update_time(time)
	$HUD.update_streak(perfect_streak)


func prepare_crosshair():
	crosshair.queue_free()
	crosshair = Crosshairs.instance()

	var spawn_location = get_node("CrosshairsPath/CrosshairSpawnLocation")
	spawn_location.offset = Util.generate_random_number()
	crosshair.position = spawn_location.position

	var direction = Util.calculate_direction(crosshair.position)
	crosshair.add_central_force(direction * speed)
	add_child(crosshair)


func update_speed():
	if perfect_streak < 10 or speed <= 1000:
		speed += 20


func handle_points_and_update_HUD(points):
	if points == 0:
		game_over()
	elif points == 10:
		perfect_streak += 1
	else:
		perfect_streak = 0
	score += points
	$HUD.update_score(score)
	$HUD.update_streak(perfect_streak)
