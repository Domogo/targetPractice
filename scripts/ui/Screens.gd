extends Node2D

signal start_game

var current_screen = null


func _ready():
	register_buttons()
	change_screen($HomeScreen)

func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	for button in buttons:
		button.connect("pressed", self, "_on_button_pressed", [button.name])

func _on_button_pressed(name):
	match name:
		"HomeButton":
			change_screen($HomeScreen)
		"PlayButton":
			change_screen(null)
			yield(get_tree().create_timer(0.5), "timeout")
			emit_signal("start_game")
		"SettingsButton":
			change_screen($SettingsScreen)

func change_screen(new_screen):
	if current_screen == new_screen:
		return
	if current_screen:
		current_screen.disappear()
		yield(current_screen.tween, "tween_completed")
	current_screen = new_screen
	if new_screen:
		current_screen.appear()
		yield(current_screen.tween, "tween_completed")

func game_over():
	change_screen($GameOverScreen)