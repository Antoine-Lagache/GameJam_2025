extends Node2D

var speed : float = 0.0 # nb pixel / seconde
var player
var direction : float = 0.0
var angular_velocity : float = 0.0
var homing = false
var screen = DisplayServer.window_get_size()

var color = Color("Purple")
@onready var sprite:Sprite2D = $"./Sprite2D"

var bullet = load("res://scene/bullet.tscn")


func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	sprite.self_modulate = color
	scale = Vector2(2, 2)
	add_to_group("bullet")

	
func _physics_process(delta: float) -> void:
	if Global.time_speed:
		var direction_vector = Vector2(cos(direction),sin(direction))
		global_position += speed*direction_vector*delta*Global.time_speed
		test_exit_screen()
	
func test_exit_screen():
	if (global_position.x < -10 or global_position.x > 10 + screen.x or global_position.y < -10 or global_position.y > 10 + screen.y):
		queue_free()

func angle_to_player(player):
	return global_position.angle_to_point(player.position)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()


func _on_timer_timeout() -> void:
	if Global.time_speed:
		for i in range(10):
			var new_bullet:Node = bullet.instantiate()
			new_bullet.speed = 400
			new_bullet.direction =  2 * PI / 5 * (i + 0.5)
			new_bullet.angular_velocity = - 0.01
			new_bullet.scale = Vector2(0.5, 0.5)
			add_child(new_bullet)
