extends KinematicBody2D

export (int) var hitPoints = 5
export (int) var attackSpeed = 200 #en centièmes de secondes
var ticks = 0

func Position_to(x,y):
	global_position = Vector2(x,y)
	

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _takeDamage(damage):
	hitPoints -= damage

func _attack_player(delta):
	ticks += (delta*100)
	if(ticks >= attackSpeed):
		_throwAttack()
		
func _throwAttack():
	print("ATTACK!!!")
	ticks = 0

func _move_towards_player():
	pass

func _process(delta):
	if(hitPoints <= 0):
		get_parent().remove_child(self)
	_move_towards_player()
	_attack_player(delta)
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
