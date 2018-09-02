extends Sprite

export (int) var player_index = 0
var trigger_action

func _ready():
	trigger_action = "player%d_trigger" % (player_index + 1)

func _input(event):
	# Orientation du GUN et PEW PEW
	var joy_x = Input.get_joy_axis(player_index, JOY_ANALOG_RX)
	var joy_y = Input.get_joy_axis(player_index, JOY_ANALOG_RY)
	if (abs(joy_x) > 0.25 || abs(joy_y) > 0.25):
		rotation = atan2(joy_x, -joy_y)
	if event.is_action_pressed(trigger_action):
		get_node("Gun").fire(player_index, rotation)
