extends CharacterBody2D


const SPEED = 300.0
const start_position = Vector2(300, 300)
var screen_size = DisplayServer.screen_get_size()
const size_player = Vector2(10,10)

func loose_pv():
	$CanvasLayer/Health_bar.health += -1

func _ready() -> void:
	add_to_group("player")
	position = start_position

func _physics_process(_delta: float) -> void:
	
	var direction := Input.get_vector("left","right","up","down").normalized()
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
	velocity = direction*SPEED
	
	move_and_slide()
