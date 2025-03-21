extends Node2D

var speed : float = 0.0 # nb pixel / seconde
var direction : float = 0.0
var angular_velocity : float = 0.0


func _ready():
	add_to_group("bullet")
	
func _physics_process(delta: float) -> void:
	if Global.time_speed:
		var direction_vector = Vector2(cos(direction),sin(direction))
		global_position += speed*direction_vector*delta*Global.time_speed
		direction += angular_velocity
		test_exit_screen()
	
func test_exit_screen():
	var screen = DisplayServer.window_get_size()
	if (global_position.x < -10 or global_position.x > 10 + screen.x or global_position.y < -10 or global_position.y > 10 + screen.y):
		queue_free()



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()
		queue_free()
