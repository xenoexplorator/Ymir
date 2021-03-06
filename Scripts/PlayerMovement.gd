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
signal heal

func _input(event):
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
	var effective_speed = speed
	if velocity_p1.length_squared() == 0:
		effective_speed /= 2
	if velocity_p2.length_squared() == 0:
		effective_speed /= 2
	return (velocity_p1.normalized() + velocity_p2.normalized()) * effective_speed

func _physics_process(delta):
	move_and_slide(velocity())

func heal(amount):
	emit_signal("heal", amount)

func upgrade_gun(duration, pickup):
	var delta = pickup - position
	var claim_p1 = delta.dot(velocity_p1)
	var claim_p2 = delta.dot(velocity_p2)
	if claim_p1 == claim_p2:
		return # probablement pas
	var player_index = int(claim_p2 > claim_p1)
	get_parent().upgrade(player_index, duration)
