extends Node

@onready var mechant = load("res://scene/mechant.tscn")
@onready var player = load("res://scene/player.tscn")


func _ready():
	var bbeg:Node = mechant.instantiate()
	var hero:Node = player.instantiate()
	bbeg.add_to_group("mechant")
	hero.add_to_group("player")
	add_child(bbeg)
	add_child(hero)
