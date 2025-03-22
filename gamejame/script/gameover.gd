extends Control

@onready var defeat_sound: AudioStreamPlayer2D = $DefeatSound

func _ready() -> void:
	print('test')
	defeat_sound.play()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/start_menu.tscn")  # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
