extends Node

@onready var mechant = load("res://scene/mechant.tscn")
@onready var player = load("res://scene/player.tscn")
@onready var time = load("res://scene/time.tscn")


func _ready():
	var bbeg:Node = mechant.instantiate()
	var hero:Node = player.instantiate()
	var temps:Node = time.instantiate()
	temps.connect("send_time_speed", on_time_speed)
	add_child(bbeg)
	add_child(hero)
	add_child(temps)

func on_time_speed(time_speed):
	player =  get_tree().get_nodes_in_group("player")[0]
	mechant =  get_tree().get_nodes_in_group("mechant")[0]
	player.time_speed = time_speed
	mechant.time_speed = time_speed
