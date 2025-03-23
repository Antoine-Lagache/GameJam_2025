extends Node2D

@onready var heal_sound: AudioStreamPlayer2D = $HealSound

var screen = DisplayServer.window_get_size()

func _ready() -> void:
	add_to_group("heal_blob")
	teleport()


func _process(delta: float) -> void:
	pass

func distance(p1: Vector2, p2: Vector2):
	var difx = p1.x - p2.x 
	var dify = p1.y - p2.y 
	return sqrt(difx * difx + dify * dify)

func teleport():
	var new_pos = Vector2(randf_range(50, screen.x-50), randf_range(50, screen.y-50))
	while(distance(new_pos, Vector2(screen.x/2, screen.y/2)) < 40):
		new_pos = Vector2(randf_range(50, screen.x-50), randf_range(50, screen.y-50))
	position = new_pos


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.heal()
		heal_sound.play()
		
	position = Vector2(-50, -50)
		


func _on_teleport_timer_timeout() -> void:
	teleport()
