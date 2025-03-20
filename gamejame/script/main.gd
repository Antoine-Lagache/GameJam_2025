extends Node

@onready var mechant = load("res://scene/mechant.tscn")
@onready var player = load("res://scene/player.tscn")


func _ready():
	var bbeg = mechant.instantiate()
	var hero = player.instantiate()
	add_child(bbeg)
	add_child(hero)
