extends Node2D


signal miss


func _ready():
	pass


func prepare(position):
	self.position = position


func hit_detection(crosshairs):
	var outer_rim_hit = get_node("OuterRim").overlaps_body(crosshairs)
	var mid_rim_hit = get_node("MidRim").overlaps_body(crosshairs)
	var inner_rim_hit = get_node("InnerRim").overlaps_body(crosshairs)
	if inner_rim_hit:
		return 10
	elif mid_rim_hit:
		return 5
	elif outer_rim_hit:
		return 1
	else:
		emit_signal("miss")
		return 0
