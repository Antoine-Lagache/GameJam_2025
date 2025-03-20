extends Node2D


@onready var bullet = load("res://scene/bullet.tscn")


func _ready():
	position = Vector2(500, 250)
	
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	for i in range(10):
		var new_bullet = bullet.instantiate()
		new_bullet.global_position = global_position
		new_bullet.speed = randf_range(5, 10)
		new_bullet.direction = randf_range(0, 2 * PI)
		new_bullet.angular_velocity = 0.01
		add_child(new_bullet)
