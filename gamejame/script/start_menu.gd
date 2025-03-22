extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")  # Replace with function body.


func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/tutorial.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit() # Replace with function body.
