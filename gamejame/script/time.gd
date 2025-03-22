extends Node2D

var time_stop = load("res://scene/time_stop.tscn")
var player:Node
var mechant:Node
var screen = DisplayServer.window_get_size()
var dist_min = 150
var retro_position = Vector2(100,100)
@onready var player_shade:Sprite2D = $"./Sprite2D"
@onready var shader_material = $Inversion_shader.material

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player =  get_tree().get_nodes_in_group("player")[0]
	mechant =  get_tree().get_nodes_in_group("mechant")[0]
	$Timer_bar.position.y = screen.y - 30
	$Inversion_shader.size = screen
	$Timer_bar.visible = false
	player_shade.self_modulate = Color(1,1,1,0.1)
	$Inversion_shader.size = screen
	spawn_time_stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	$Timer_bar/blue.scale.x = $Timer.time_left/$Timer.wait_time

func spawn_time_stop():
	while true:
		var spawn_pos = Vector2(randf_range(0,screen.x), randf_range(0,screen.y))
		if min(spawn_pos.distance_to(retro_position),spawn_pos.distance_to(mechant.position))>dist_min:
			var new_time_stop = time_stop.instantiate()
			new_time_stop.position = spawn_pos
			call_deferred("add_child", new_time_stop)
			break

func start_timer():
	$Timer.start()
	shader_material.set_shader_parameter("invert", true)
	retro_position = player.position
	player_shade.position = retro_position
	player_shade.visible = true
	$Timer_bar.visible = true

func _on_timer_timeout() -> void:
	Global.time_speed = 1.0
	$Timer_bar.visible = false
	shader_material.set_shader_parameter("invert", false)
	player_shade.visible = false
	player.position = retro_position
	player.i_frames = 30
	spawn_time_stop()
	
func on_mechant_hit():
	Global.time_speed = 1.0
	$Timer_bar.visible = false
	player_shade.visible = false
	$Timer.stop()
	shader_material.set_shader_parameter("invert", false)
	player.position = retro_position
	player.i_frames = 30
	spawn_time_stop()
	
