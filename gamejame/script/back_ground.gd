extends ColorRect

@export var speed = -0.1
var offset = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset.x += speed*delta*(Global.time_speed-0.5)
	material.set_shader_parameter("fog_offset", offset)
