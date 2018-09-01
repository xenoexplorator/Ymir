extends KinematicBody2D

export (int) var speed = 200

var velocity_p1 = Vector2()
var velocity_p2 = Vector2()
var joy1_x = 0.0
var joy1_y = 0.0
var joy2_x = 0.0
var joy2_y = 0.0
signal move_right_leg
signal move_left_leg

func get_input():
	joy1_x = Input.get_joy_axis(0, JOY_ANALOG_LX)
	joy1_y = Input.get_joy_axis(0, JOY_ANALOG_LY)
	if (abs(joy1_x) < 0.25 && abs(joy1_y) < 0.25):
		velocity_p1 = Vector2()
	else:
		velocity_p1 = Vector2(joy1_x, joy1_y)
		emit_signal("move_left_leg", atan2(-joy1_x, joy1_y))
	joy2_x = Input.get_joy_axis(1, JOY_ANALOG_LX)
	joy2_y = Input.get_joy_axis(1, JOY_ANALOG_LY)
	if (abs(joy2_x) < 0.25 && abs(joy2_y) < 0.25):
		velocity_p2 = Vector2()
	else:
		velocity_p2 = Vector2(joy2_x, joy2_y)
		emit_signal("move_right_leg", atan2(-joy2_x, joy2_y))

func velocity():
	return velocity_p1.normalized() + velocity_p2.normalized()

func _physics_process(delta):
	get_input()
	move_and_slide(velocity() * speed)
