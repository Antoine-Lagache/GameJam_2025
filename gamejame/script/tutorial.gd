extends Control
@onready var go_back: TextureButton = $Panel/GoBack

func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/start_menu.tscn")
	
