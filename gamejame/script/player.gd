extends CharacterBody2D

@onready var hero_hit: AudioStreamPlayer = $HeroHit

const SPEED = 500.0
const start_position = Vector2(300, 300)
var screen_size = DisplayServer.window_get_size()
const size_player = Vector2(10,10)
var i_frames = 30
var mechant:Node
var direction: Vector2


func loose_pv():
	if i_frames <= 0:
		hero_hit.play()
		$Sprite2D.material.set_shader_parameter("flash_modifier", 0.7)
		$Flash_Timer.start()
		$CanvasLayer/Health_bar.health += -1
		if $CanvasLayer/Health_bar.health == 0:
			get_tree().change_scene_to_file("res://scene/gameover.tscn")
		i_frames = 30

func _ready() -> void:
	add_to_group("player")
	position = start_position
	scale = Vector2(0.7, 0.7)

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down").normalized()
	
	if position.x < size_player.x:
		position.x = size_player.x
		velocity.x = abs(velocity.x)
	elif position.x > screen_size.x-size_player.x:
		position.x = screen_size.x-size_player.x
		velocity.x = -abs(-velocity.x)
	if position.y < size_player.y:
		position.y = size_player.y
		velocity.y = abs(velocity.y)
	elif position.y > screen_size.y-size_player.y:
		position.y = screen_size.y-size_player.y
		velocity.y = -abs(-velocity.y)
	
	elif Input.is_key_pressed(KEY_SHIFT):
		velocity = direction*SPEED/2
	else:
		velocity = direction*SPEED
		
	if i_frames > 0:
		i_frames -= 1
	
	move_and_slide()


func _on_flash_timer_timeout() -> void:
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.0)
