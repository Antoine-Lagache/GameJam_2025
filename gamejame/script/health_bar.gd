extends Node2D

@export var max_health:int = 10
@export var health:int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	$green.scale.x = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	$green.scale.x = health/max_health
	if health < 0:
		health = 0
	$Label.text = str(health) + "/" + str(max_health)
