extends KinematicBody2D

export (int) var speed = 10
export (int) var power = 10
var velocity = Vector2(0, -1)
var player_index = -1

func shoot(player, origin, orientation):
	player_index = player
	transform.origin = origin
	rotation = orientation
	velocity = velocity.rotated(orientation)
	colorize()

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed)
	if collision:
		if collision.collider.has_method("_takeDamage"):
			collision.collider._takeDamage(power, player_index)
			power = 0
		queue_free()

func colorize():
	if(player_index == 0):
		get_node("Sprite").modulate= Color(0,1,0,1)
	elif(player_index == 1):
		get_node("Sprite").modulate = Color(0,0,1,1)