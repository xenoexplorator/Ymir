extends KinematicBody2D

export (int) var hitPoints = 40
export (int) var attackSpeed = 200
export (int) var ticksBetweenShots = 20 #en centièmes de secondes
export (int) var numberOfShots = 10
var currentNumberOfAttacks = 0
var currentTicksBetweenAttacks = 0
export (int) var points = 50
export (int) var speed = 125
var ticks = 0
signal enemy_death
var player
var dir
var bullet = preload("res://Scenes/EnemyBullet.tscn")
var soundEffect

func Position_to(x,y):
	global_position = Vector2(x,y)

func _ready():
	soundEffect = get_node("Sound")

func Set_Player(node):
	player = node

func _takeDamage(damage, player_index):
	hitPoints -= damage
	if hitPoints < 0:
		emit_signal("enemy_death", player_index, points)
		points = 0
		queue_free()

func _attack_player(deltaTicks):
	ticks += (deltaTicks)
	if(ticks >= attackSpeed):
		_throwAttack(deltaTicks)
		if(currentNumberOfAttacks >= numberOfShots):
			ticks = 0
			currentNumberOfAttacks = 0
			currentTicksBetweenAttacks = 0

func _throwAttack(deltaTicks):
	if(currentTicksBetweenAttacks <= 0):
		var dirOfAttack = dir.rotated(rand_range(-0.25,0.25))
		var tempBullet = bullet.instance()
		tempBullet.shoot(global_position, dirOfAttack)
		get_parent().add_child(tempBullet)
		currentNumberOfAttacks += 1
		currentTicksBetweenAttacks = ticksBetweenShots
		soundEffect.play(0)
	else:
		currentTicksBetweenAttacks -= deltaTicks

func _move_towards_player():
	get_node("Gun").rotation = (atan2(-dir.x, dir.y))-(PI/2)
	move_and_slide(dir * speed)

func _process(delta):
	var distance = (player.global_position - global_position)
	dir = distance.normalized()
	if(distance.length() > 200):
		_move_towards_player()
	_attack_player(delta * 100)
	
