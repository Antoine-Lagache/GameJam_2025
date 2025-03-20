extends Node2D


@onready var bullet = load("res://scene/bullet.tscn")


func _ready():
	var screen = DisplayServer.screen_get_size()
	position = Vector2(screen.x/2, screen.y/2)
	
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var angle = randf_range(0, 2 * PI)
	for i in range(10):
		var new_bullet = bullet.instantiate()
		new_bullet.speed = 10
		new_bullet.direction =  2 * PI / 10 * i + angle
		new_bullet.angular_velocity = 0.01
		add_child(new_bullet)
	for i in range(10):
		var new_bullet = bullet.instantiate()
		new_bullet.speed = 10
		new_bullet.direction =  2 * PI / 10 * (i + 0.5) + angle
		new_bullet.angular_velocity = - 0.01
		add_child(new_bullet)
