extends Control


func _ready() -> void:
	set_process_input(true) 
	if (not MenuMusic.playing):
		MenuMusic.play()

func _on_start_button_pressed() -> void:
	Global.niveau = 1
	get_tree().change_scene_to_file("res://scene/main.tscn")  # Replace with function body.


func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/tutorial.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit() # Replace with function body.



func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/credits.tscn")
	
func _input(ev):
	if Input.is_key_pressed(KEY_T) && Input.is_key_pressed(KEY_O) && Input.is_key_pressed(KEY_U):
		print("almost")
