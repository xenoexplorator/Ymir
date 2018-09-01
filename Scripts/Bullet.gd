extends KinematicBody2D

export (int) var speed = 10
export (int) var power = 10
var velocity = Vector2(0, -1)
var player_index = -1

func shoot(player, origin, orientation):
	player_index = player
	transform.origin = origin
	velocity = velocity.rotated(orientation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed)
	if collision:
		if collision.collider.has_method("_takeDamage"):
			collision.collider._takeDamage(power, player_index)
			power = 0
		queue_free()
