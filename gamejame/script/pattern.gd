extends Node2D

@onready var bullet = load("res://scene/bullet.tscn")
var bullet_limit:int = 200
var pattern_id:int = 1


func _ready():
	start_pattern(pattern_id)
	
func _physics_process(delta: float) -> void:
	pass
	
func start_pattern(id:int) -> void:
	pattern_id = id
	match id:
		0:
			pass
		1:
			pattern_1()
		2:
			pattern_2()
		_:
			print("idk what happened, but you are trying to use a non existent pattern")
			
func pattern_1():
	while(pattern_id == 1):
		await get_tree().create_timer(1.0).timeout
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var angle = randf_range(0, 2 * PI)
			for i in range(10):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 600
				new_bullet.direction =  2 * PI / 10 * i + angle
				new_bullet.angular_velocity = 0.01
				add_child(new_bullet)
			for i in range(10):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 600
				new_bullet.direction =  2 * PI / 10 * (i + 0.5) + angle
				new_bullet.angular_velocity = - 0.01
				add_child(new_bullet)
				
func pattern_2():
	var angle = randf_range(0, 2 * PI)
	while(pattern_id == 2):
		await get_tree().create_timer(1/(4*PI)).timeout # on veut faire un tour en une seconde
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			for i in range(3):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 600
				new_bullet.direction = angle + i*2*PI/3
				add_child(new_bullet)
			angle += 1/(4*PI)
