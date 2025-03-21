extends Node2D

var speed : float = 0.0 # nb pixel / seconde
var player
var direction : float = 0.0
var angular_velocity : float = 0.0
var homing = false
var screen = DisplayServer.window_get_size()


func _ready():
	player =  get_tree().get_nodes_in_group("player")[0]
	add_to_group("bullet")
	
func _physics_process(delta: float) -> void:
	if Global.time_speed:
		var direction_vector = Vector2(cos(direction),sin(direction))
		global_position += speed*direction_vector*delta*Global.time_speed
		direction += angular_velocity
		if homing:
			direction = angle_to_player(player)
		test_exit_screen()
	
func test_exit_screen():
	if (global_position.x < -10 or global_position.x > 10 + screen.x or global_position.y < -10 or global_position.y > 10 + screen.y):
		queue_free()

func angle_to_player(player):
	return global_position.angle_to_point(player.position)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()
		queue_free()
