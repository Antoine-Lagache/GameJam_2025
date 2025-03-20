extends Node2D


@onready var bullet = load("res://scene/bullet.tscn")
signal hit_player

func _ready():
	var screen = DisplayServer.screen_get_size()
	position = Vector2(screen.x/2, screen.y/2)
	
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var angle = randf_range(0, 2 * PI)
	for i in range(10):
		var new_bullet:Node = bullet.instantiate()
		new_bullet.add_to_group("bullet")
		new_bullet.connect("hit_player", on_hit_player)
		new_bullet.speed = 600
		new_bullet.direction =  2 * PI / 10 * i + angle
		new_bullet.angular_velocity = 0.01
		add_child(new_bullet)
	for i in range(10):
		var new_bullet:Node = bullet.instantiate()
		new_bullet.add_to_group("bullet")
		new_bullet.connect("hit_player", on_hit_player)
		new_bullet.speed = 600
		new_bullet.direction =  2 * PI / 10 * (i + 0.5) + angle
		new_bullet.angular_velocity = - 0.01
		add_child(new_bullet)

func on_hit_player(body):
	body.loose_pv()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()
