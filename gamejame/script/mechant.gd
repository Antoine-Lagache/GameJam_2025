extends Node2D

signal mechant_hit

var pattern_path = load("res://scene/pattern.tscn")
var bullet_limit:int = 100
var pattern = pattern_path.instantiate()

func _ready():
	add_to_group("mechant")
	var screen = DisplayServer.window_get_size()
	position = Vector2(screen.x/2, screen.y/2)
	pattern.pattern_id=3
	add_child(pattern)
	$CanvasLayer/Health_bar.max_health = 5
	$CanvasLayer/Health_bar.position = Vector2(screen.x - $CanvasLayer/Health_bar/red.size.x,0)
	
func _physics_process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	# Un peu wacky mais ça combine les deux pattern
	# pattern.start_pattern(1+(pattern.pattern_id%2))
	var new_pattern = randi_range(1,5)
	while new_pattern == pattern.pattern_id:
		new_pattern = randi_range(1,5)
	pattern.start_pattern(new_pattern)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and Global.time_speed:
		body.loose_pv()
	elif body.is_in_group("player") and Global.time_speed ==0.:
		$CanvasLayer/Health_bar.health += -1
		emit_signal("mechant_hit")
