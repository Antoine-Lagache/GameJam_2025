extends Node2D

var time_stop = load("res://scene/time_stop.tscn")
var player:Node
var mechant:Node
var screen = DisplayServer.screen_get_size()
var dist_min = 150


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player =  get_tree().get_nodes_in_group("player")[0]
	mechant =  get_tree().get_nodes_in_group("mechant")[0]
	spawn_time_stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	pass

func spawn_time_stop():
	while true:
		var spawn_pos = Vector2(randf_range(0,screen.x), randf_range(0,screen.y))
		if max(spawn_pos.distance_to(player.position),spawn_pos.distance_to(mechant.position))>dist_min:
			var new_time_stop = time_stop.instantiate()
			new_time_stop.position = spawn_pos
			add_child(new_time_stop)
			break

func on_time_stop():
	Global.time_speed = 0.
	
