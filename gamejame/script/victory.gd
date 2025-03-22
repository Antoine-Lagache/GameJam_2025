extends Control

@onready var victory_sound: AudioStreamPlayer2D = $VictorySound
@onready var title: Label = $Panel/Title



func _ready():
	victory_sound.play()

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/start_menu.tscn") # Replace with function body.


func _on_victory_title_timer_timeout() -> void:
	if (title.get("theme_override_colors/font_color") == Color.BLUE):
		title.set("theme_override_colors/font_color", Color.WHITE)
	else:
		title.set("theme_override_colors/font_color", Color.BLUE)
		
