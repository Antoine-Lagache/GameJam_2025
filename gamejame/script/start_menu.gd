extends Control



func _on_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")  # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit() # Replace with function body.
