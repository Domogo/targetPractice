extends RigidBody2D

var pos = Vector2(0, 0)
var velocity = Vector2(0, 0)
var should_reset = true


func _ready():
	pass


func _physics_process(delta):
	if should_reset:
		self.set_position(pos)
		self.set_linear_velocity(velocity)
		should_reset = false
	self.position += self.linear_velocity * delta


func _on_Visibility_viewport_exited(_viewport):
	pass # Replace with function body.


func send_new_position_and_velocity(new_position, new_velocity):
	pos = new_position
	velocity = new_velocity
	should_reset = true
	
