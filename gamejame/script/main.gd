extends Node

@onready var mechant = load("res://scene/mechant.tscn")
@onready var player = load("res://scene/player.tscn")
@onready var time = load("res://scene/time.tscn")


func _ready():
	var bbeg:Node = mechant.instantiate()
	var hero:Node = player.instantiate()
	var temps:Node = time.instantiate()
	hero.mechant = bbeg
	add_child(bbeg)
	add_child(hero)
	add_child(temps)
	bbeg.connect("mechant_hit", Callable(temps, "on_mechant_hit"))
