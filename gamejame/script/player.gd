extends CharacterBody2D

@onready var hero_hit: AudioStreamPlayer = $HeroHit
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 500.0
const start_position = Vector2(300, 300)
var screen_size = DisplayServer.window_get_size()
const size_player = Vector2(10,10)
var i_frames = 30
var mechant:Node
var direction: Vector2
var is_dead: bool = false


func loose_pv():
	if i_frames <= 0:
		hero_hit.play()
		$Sprite2D.material.set_shader_parameter("flash_modifier", 0.7)
		# $Flash_Timer.start()
		flash_start()
		$CanvasLayer/Health_bar.health += -1
		if $CanvasLayer/Health_bar.health == 0:
			animation_player.play("Dying_right")
		i_frames = 30

func heal():
	if $CanvasLayer/Health_bar.health < $CanvasLayer/Health_bar.max_health:
		$CanvasLayer/Health_bar.health += 1

		
func flash_start():
	var number_of_flash = 3
	for i in range(number_of_flash):
		$Flash_Timer.start(0.08)
		$Sprite2D.material.set_shader_parameter("flash_modifier", 0.6)
		await $Flash_Timer.timeout
		$Sprite2D.material.set_shader_parameter("flash_modifier", 0.0)
		$Flash_Timer.start(0.12)
		await $Flash_Timer.timeout

func _ready() -> void:
	add_to_group("player")
	position = start_position
	scale = Vector2(0.7, 0.7)

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down").normalized()
	
	if is_dead:
		if (position.y < 1080):
			position.y += 1080 * _delta
			position.x += 150 * _delta
	else:
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
		
		if direction.x <0:
			$Sprite2D.flip_h  = true
		else:
			$Sprite2D.flip_h = false
			
		if i_frames > 0:
			i_frames -= 1
		
		move_and_slide()


func _on_flash_timer_timeout() -> void:
	$Sprite2D.material.set_shader_parameter("flash_modifier", 0.0)
	
func dying() -> void: #called by animation_player
	is_dead = true
	
func game_is_over(): #called by animation_player
	if Global.niveau != 3:
		get_tree().change_scene_to_file("res://scene/gameover.tscn")
	else:
		get_tree().change_scene_to_file("res://scene/gameover_lvl3.tscn")
