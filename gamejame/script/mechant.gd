extends Node2D


var pattern_path = load("res://scene/pattern.tscn")
var bullet_limit:int = 100
var pattern = pattern_path.instantiate()

func _ready():
	add_to_group("mechant")
	var screen = DisplayServer.window_get_size()
	position = Vector2(screen.x/2, screen.y/2)
	pattern.pattern_id=3
	add_child(pattern)
	
func _physics_process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	# Un peu wacky mais ça combine les deux pattern
	# pattern.start_pattern(1+(pattern.pattern_id%2))
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()
