extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("time_stop")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_parent().start_timer()
		Global.time_speed = 0.
		queue_free()
