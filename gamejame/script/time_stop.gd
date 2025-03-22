extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var power_apparition: AudioStreamPlayer2D = $Power_apparition

var slow_time = false
var slowing = true # sorry

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	power_apparition.play()
	add_to_group("time_stop")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if slow_time and Global.time_speed>0 and slowing:
		Global.time_speed += -delta/0.3
	elif slow_time:
		slow_time = false
		Global.time_speed = 0.
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		animation_player.play("pick_up")
		get_parent().start_timer()
		slow_time = true
