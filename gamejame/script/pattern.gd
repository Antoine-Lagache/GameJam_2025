extends Node2D

@onready var bullet = load("res://scene/bullet.tscn")
var bullet_limit:int = 200
var pattern_id:int = 1

@onready var big_bullet = load("res://scene/big_bullet.tscn")

var player:Node
var mechant:Node


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
		3:
			pattern_3()
		4:
			pattern_4()
		5:
			pattern_5()
		6:
			pattern_6()
		7:
			pattern_7()
		8:
			pattern_8()
		9:
			pattern_9()
		10:
			pattern_10()
		11:
			pattern_11()
		12:
			pattern_12()
		13:
			pattern_13()
		14:
			pattern_14()
		15:
			pass
		16:
			pass
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			pass
		_:
			print("idk what happened, but you are trying to use a non existent pattern")
			
func pattern_1():
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 1):
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
		await get_tree().create_timer(1.0).timeout
				
				
				
func pattern_2():
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	var angle = randf_range(0, 2 * PI)
	while(pattern_id == 2):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			for i in range(3):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 100
				new_bullet.color = Color("pink")
				new_bullet.direction = angle + i*2*PI/3
				add_child(new_bullet)
			angle += 1/(2*PI)
		await get_tree().create_timer(1/(2*PI)).timeout # on veut faire un tour en une seconde
			
			
			
func pattern_3(): # slow homing
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 3):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var new_bullet:Node = bullet.instantiate()
			new_bullet.speed = 300
			new_bullet.color = Color("cyan")
			new_bullet.homing = true
			add_child(new_bullet)
		await get_tree().create_timer(0.2).timeout # on veut faire un tour en une seconde
			
			
			
func pattern_4(): # weird azzayu's teleport idea
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 4):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var color = Color(randf_range(0,1),randf_range(0,1),randf_range(0,1))
			var new_bullet:Node = bullet.instantiate()
			new_bullet.speed = 400
			new_bullet.color = color
			new_bullet.direction = randf_range(0.0,2*PI)
			var bro:Node = bullet.instantiate()
			bro.speed = 600
			bro.color = color
			bro.direction = randf_range(0.0,2*PI)
			bro.is_dual = true
			new_bullet.is_dual = true
			bro.dual = new_bullet
			new_bullet.dual = bro
			add_child(new_bullet)
			add_child(bro)
		await get_tree().create_timer(0.2).timeout
		
func pattern_5():
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	var angle = randf_range(0, 2 * PI)
	while(pattern_id == 5):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var colors = ["red","magenta","blue","yellow","green","cyan"]
			for i in range(6):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 800
				new_bullet.color = Color(colors[i])
				new_bullet.direction = angle + i*2*PI/6
				add_child(new_bullet)
			angle += 0.05
		await get_tree().create_timer(0.1).timeout # on veut faire un tour en une seconde



func pattern_6(): # big bullet that makes bullets
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 6):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			for i in range(5):
				var new_bullet:Node = big_bullet.instantiate()
				new_bullet.speed = 150
				new_bullet.direction =  2 * PI / 5 * i
				new_bullet.angular_velocity = 0.01
				add_child(new_bullet)
		await get_tree().create_timer(2.0).timeout
		

func pattern_7(): # circles
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 7):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var circle_size = 15
			var angle = randf_range(0,2*PI)
			var pos = Vector2(randf_range(-50,50),randf_range(-50,50))
			for i in range(circle_size):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 400
				new_bullet.color = Color("yellow")
				new_bullet.direction = angle + i*2*PI/circle_size
				new_bullet.position += pos
				add_child(new_bullet)
		await get_tree().create_timer(0.5).timeout
		
func pattern_8(): # bam
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	player =  get_tree().get_nodes_in_group("player")[0]
	mechant =  get_tree().get_nodes_in_group("mechant")[0]
	while(pattern_id == 8):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var baam_size = 15
			var angle = mechant.position.angle_to_point(player.position)
			for i in range(baam_size):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 400+randi_range(0,300)
				new_bullet.color = Color(1.0,randf_range(0.,1.),0.)
				new_bullet.direction = angle + randf_range(-PI/10,PI/10)
				add_child(new_bullet)
		await get_tree().create_timer(1).timeout
		
func pattern_9(): # spin2win
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 9):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var new_bullet:Node = bullet.instantiate()
			new_bullet.speed = 100
			new_bullet.direction = randf_range(0, 2 * PI)
			new_bullet.color = Color("green")
			new_bullet.angular_velocity = 0.005
			add_child(new_bullet)
		await get_tree().create_timer(0.05).timeout
		
func pattern_10(): # fat circle
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 10):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var circle_size = 50
			var angle = randf_range(0,2*PI)
			for i in range(circle_size):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 200
				new_bullet.color = Color("white")
				new_bullet.direction = angle + i*2*PI/circle_size
				add_child(new_bullet)
		await get_tree().create_timer(3.0).timeout
		
func pattern_11(): # fatter circle
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	while(pattern_id == 11):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var circle_size = 90
			var angle = randf_range(0,2*PI)
			for i in range(circle_size):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 300
				new_bullet.color = Color("blue")
				if i%6 >= 3:
					new_bullet.speed = 250
					new_bullet.color = Color("cyan")
				new_bullet.direction = angle + i*2*PI/circle_size
				add_child(new_bullet)
		await get_tree().create_timer(3.0).timeout
		
func pattern_12(): # Time stop? dont care
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	var angle = randf_range(0,2*PI)
	while(pattern_id == 12):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit:
			var circle_size = 7
			for i in range(circle_size):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 300
				new_bullet.is_time_immune = 1.
				new_bullet.color = Color(0.,0.,0.,0.5)
				new_bullet.direction = angle + i*2*PI/circle_size
				add_child(new_bullet)
			angle += PI/circle_size
		await get_tree().create_timer(0.5).timeout
		
func pattern_13(): # reversed spinning???
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	var angle = randf_range(0,2*PI)
	var r = 10
	while(pattern_id == 13):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit and Global.time_speed:
			var circle_size = 3
			for i in range(circle_size):
				var new_bullet:Node = bullet.instantiate()
				new_bullet.speed = 300
				new_bullet.color = Color("violet")
				var dis_angle = angle + i*2*PI/circle_size
				new_bullet.position += r*Vector2.from_angle(dis_angle)
				new_bullet.direction = dis_angle + PI
				add_child(new_bullet)
			angle += 0.2
			r += 5
		await get_tree().create_timer(0.05).timeout
		
func pattern_14(): # grand gignol zano kaichi
	await get_tree().create_timer(0.5).timeout # On evite le spawn kill au chgt de pattern
	player =  get_tree().get_nodes_in_group("player")[0]
	var angle1 = randf_range(0,2*PI)
	var angle2 = randf_range(0,2*PI)
	while(pattern_id == 14):
		if len(get_tree().get_nodes_in_group("bullet")) < bullet_limit:
			var circle_size = 2
			for i in range(circle_size):
				for j in range(3):
					var new_bullet:Node = bullet.instantiate()
					new_bullet.speed = 500
					new_bullet.color = Color("violet")
					add_child(new_bullet)
					new_bullet.position += 100*Vector2.from_angle(angle1 + i*PI*2/circle_size)
					new_bullet.direction = new_bullet.global_position.angle_to_point(player.position) - PI/10 + j*PI/10
					
				for j in range(3):
					var new_bullet:Node = bullet.instantiate()
					new_bullet.speed = 500
					new_bullet.color = Color("red")
					add_child(new_bullet)
					new_bullet.global_position += 100*Vector2.from_angle(angle2 + i*PI*2/circle_size)
					new_bullet.direction = new_bullet.global_position.angle_to_point(player.position) - PI/10 + j*PI/10
					
			angle1 += 0.02
			angle2 -= 0.02
		await get_tree().create_timer(0.1).timeout
