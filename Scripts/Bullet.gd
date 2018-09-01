extends KinematicBody2D

export (int) var speed = 10
export (int) var power = 10
var velocity = Vector2(0, -1)

func shoot(origin, orientation):
	transform.origin = origin
	velocity = velocity.rotated(orientation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed)
	if collision:
		print(collision.collider)
		if collision.collider.has_method("_takeDamage"):
			collision.collider._takeDamage(power)
		queue_free()
