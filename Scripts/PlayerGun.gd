extends Sprite

export (int) var player_index = 0
signal gun_fired

func _physics_process(delta):
	# Orientation du GUN et PEW PEW
	var joy_x = Input.get_joy_axis(player_index, JOY_ANALOG_RX)
	var joy_y = Input.get_joy_axis(player_index, JOY_ANALOG_RY)
	if (abs(joy_x) > 0.25 || abs(joy_y) > 0.25):
		rotation = atan2(joy_x, -joy_y)
		fire()

func fire():
	var g_trans = get_global_transform()
	var orientation = g_trans.get_rotation()
	var origin = g_trans.get_origin()
	var off = offset.rotated(orientation) * g_trans.get_scale()
	emit_signal("gun_fired", player_index, origin + off, orientation)
