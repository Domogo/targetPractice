extends RigidBody2D


func _ready():
	pass


func is_off_screen():
	return not get_node("Visibility").is_on_screen()
