extends Node


func calculate_direction(crosshairPosition, targetPosition):
	return (targetPosition - crosshairPosition).normalized()


func generate_random_number():
	randomize()
	return randi()
