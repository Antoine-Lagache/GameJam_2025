extends Node

@onready var mechant = load("res://scene/mechant.tscn")
@onready var player = load("res://scene/player.tscn")
@onready var time = load("res://scene/time.tscn")
@onready var heal_blob = load("res://scene/heal_blob.tscn")


func _ready():
	var bbeg:Node = mechant.instantiate()
	var hero:Node = player.instantiate()
	var temps:Node = time.instantiate()
	var heal_blob:Node = heal_blob.instantiate()
	hero.mechant = bbeg
	add_child(bbeg)
	add_child(hero)
	add_child(temps)
	bbeg.connect("mechant_hit", Callable(temps, "on_mechant_hit"))
