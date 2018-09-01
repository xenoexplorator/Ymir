extends Sprite

export (int) var player_index = 0
signal gun_fired

var joy_x = 0.0
var joy_y = 0.0

func _physics_process(delta):
	# Orientation du GUN
	joy_x = Input.get_joy_axis(player_index, JOY_ANALOG_RX)
	joy_y = Input.get_joy_axis(player_index, JOY_ANALOG_RY)
	if (abs(joy_x) > 0.25 || abs(joy_y) > 0.25):
		rotation = atan2(joy_x, -joy_y)
	# Pew pew?

func _debug_gun_fired():
	print("pew pew!")