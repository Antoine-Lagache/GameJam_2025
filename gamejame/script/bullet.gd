extends Node2D

var speed = 10.0 # nb pixel / seconde
var direction : float = 0.5



func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	var direction_vector = Vector2(cos(direction),sin(direction))
	global_position += speed*direction_vector
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
