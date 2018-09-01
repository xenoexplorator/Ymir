extends KinematicBody2D

export (int) var hitPoints = 5
export (int) var attackSpeed = 200 #en centièmes de secondes
export (int) var points = 50
export (int) var speed = 125
var ticks = 0
signal enemy_death
var player

func Position_to(x,y):
	global_position = Vector2(x,y)

func _ready():
	pass

func Set_Player(node):
	player = node

func _takeDamage(damage, player_index):
	hitPoints -= damage
	if hitPoints < 0:
		emit_signal("enemy_death", player_index, points)
		points = 0
		queue_free()

func _attack_player(delta):
	ticks += (delta*100)
	if(ticks >= attackSpeed):
		_throwAttack()

func _throwAttack():
	#print("ATTACK!!!")
	ticks = 0

func _move_towards_player():
	var dir = (player.global_position - global_position).normalized()
	move_and_slide(dir * speed)

func _process(delta):
	_move_towards_player()
	_attack_player(delta)
