extends Control

@onready var defeat_sound: AudioStreamPlayer2D = $DefeatSound
@onready var gameover_title_timer: Timer = $GameoverTitleTimer
@onready var title: Label = $Panel/Title

func _ready() -> void:
	defeat_sound.play()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/start_menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()



func _on_gameover_title_timer_timeout() -> void:
	if (title.get("theme_override_colors/font_color") == Color.RED):
		title.set("theme_override_colors/font_color", Color.WHITE)
	else:
		title.set("theme_override_colors/font_color", Color.RED)


func _on_try_again_button_pressed() -> void:
	Global.niveau = 1
	get_tree().change_scene_to_file("res://scene/main.tscn")
	


func _on_retry_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")
	
