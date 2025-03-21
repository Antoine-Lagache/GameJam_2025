extends Node

var time_speed:float = 1.0 #var dispo sur toutes les scènes avec Global.time_speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_speed = 1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
