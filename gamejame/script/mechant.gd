extends Node2D


@onready var bullet = load("res://scene/bullet.tscn")

var angle = 0

func _ready():
	position = Vector2(500, 250)
	
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	angle = angle + 2 * PI / 25
	for i in range(10):
		var new_bullet = bullet.instantiate()
		new_bullet.global_position = global_position
		new_bullet.speed = 10
		new_bullet.direction =  2 * PI / 10 * i + angle
		new_bullet.angular_velocity = 0.01
		add_child(new_bullet)
	for i in range(10):
		var new_bullet = bullet.instantiate()
		new_bullet.global_position = global_position
		new_bullet.speed = 10
		new_bullet.direction =  2 * PI / 10 * (i + 0.5) + angle
		new_bullet.angular_velocity = - 0.01
		add_child(new_bullet)
