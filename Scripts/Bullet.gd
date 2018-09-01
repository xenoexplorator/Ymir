extends KinematicBody2D

export (int) var speed = 100
var velocity = Vector2(0, -1)

func shoot(origin, orientation):
	transform.origin = origin
	velocity = velocity.rotated(orientation)

func _physics_process(delta):
	move_and_slide(velocity * speed)
