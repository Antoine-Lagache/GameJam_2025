extends Node2D

var screen = DisplayServer.window_get_size()

func _ready() -> void:
	add_to_group("heal_blob")
	teleport()


func _process(delta: float) -> void:
	pass


func teleport():
	position = Vector2(randf_range(10, screen.x), randf_range(10, screen.y))


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.heal()
	teleport()
		


func _on_teleport_timer_timeout() -> void:
	teleport()
