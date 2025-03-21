extends Node2D


@onready var bullet = load("res://scene/bullet.tscn")
var time_speed:float = 1.0
var bullet_limit:int = 100

func _ready():
	add_to_group("mechant")
	var screen = DisplayServer.screen_get_size()
	position = Vector2(screen.x/2, screen.y/2)
	
func _physics_process(delta: float) -> void:
	for bullets in get_tree().get_nodes_in_group("bullet"):
		bullets.time_speed = time_speed


func _on_timer_timeout() -> void:
	print(len(get_tree().get_nodes_in_group("bullet")))
	if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit:
		var angle = randf_range(0, 2 * PI)
		for i in range(10):
			var new_bullet:Node = bullet.instantiate()
			new_bullet.speed = 600
			new_bullet.direction =  2 * PI / 10 * i + angle
			new_bullet.angular_velocity = 0.01
			add_child(new_bullet)
		for i in range(10):
			var new_bullet:Node = bullet.instantiate()
			new_bullet.speed = 600
			new_bullet.direction =  2 * PI / 10 * (i + 0.5) + angle
			new_bullet.angular_velocity = - 0.01
			add_child(new_bullet)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()
