extends Node2D


@onready var pattern_path = load("res://scene/pattern.tscn")
var bullet_limit:int = 100

func _ready():
	add_to_group("mechant")
	var screen = DisplayServer.screen_get_size()
	position = Vector2(screen.x/2, screen.y/2)
	var pattern = pattern_path.instantiate()
	add_child(pattern)
	
func _physics_process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.loose_pv()
