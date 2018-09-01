extends Sprite

export (int) var player_index = 0

func _physics_process(delta):
	# Orientation du GUN et PEW PEW
	var joy_x = Input.get_joy_axis(player_index, JOY_ANALOG_RX)
	var joy_y = Input.get_joy_axis(player_index, JOY_ANALOG_RY)
	if (abs(joy_x) > 0.25 || abs(joy_y) > 0.25):
		rotation = atan2(joy_x, -joy_y)
		get_node("Gun").fire(player_index, rotation)
