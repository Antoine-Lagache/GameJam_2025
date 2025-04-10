extends Node

@onready var mechant = load("res://scene/mechant.tscn")
@onready var player = load("res://scene/player.tscn")
@onready var time = load("res://scene/time.tscn")
@onready var heal_blob = load("res://scene/heal_blob.tscn")


func _ready():
	if (MenuMusic.playing):
		MenuMusic.stop()
	var bbeg:Node = mechant.instantiate()
	var hero:Node = player.instantiate()
	var temps:Node = time.instantiate()
	var heal_blob:Node = heal_blob.instantiate()
	Global.time_speed = 1.
	hero.mechant = bbeg
	add_child(bbeg)
	add_child(hero)
	add_child(temps)
	add_child(heal_blob)
	bbeg.connect("mechant_hit", Callable(temps, "on_mechant_hit"))
