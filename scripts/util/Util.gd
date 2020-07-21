extends Node


func calculate_direction(position):
	var destination = get_viewport().size / 2
	var direction = (destination - position).normalized()
	return direction

func generate_random_number():
	randomize()
	return randi()
