extends TextureButton

@onready var hover_sound: AudioStreamPlayer2D = $hoverSound

func _on_mouse_entered() -> void:
	hover_sound.play()
	
