extends Node2D

var speed : float # nb pixel / seconde
var direction : float



func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	var direction_vector = Vector2(cos(direction),sin(direction))
	global_position += speed*direction_vector
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
