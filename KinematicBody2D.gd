extends KinematicBody2D

export (int) var speed = 10
export (int) var power = 10
var velocity = Vector2(1, 0)

func shoot(origin, orientation):
	transform.origin = origin
	velocity = velocity.rotated(orientation.angle())

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed)
	if collision:
		if collision.collider.has_method("_takeDamage"):
			collision.collider._takeDamage(power)
		queue_free()
