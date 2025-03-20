extends RigidBody2D

var x
var y

@onready var bullet = "res://scene/bullet.tscn"


func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	add_child(bullet.instantiate())
