extends Sprite

export (int) var fire_delay = 3
var heat = 0
signal gun_fired
var soundEffect

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	soundEffect = get_node("Sound")
	pass

func fire(player_index, orientation):
	heat += 1
	if (heat < fire_delay):
		return
	heat -= fire_delay
	emit_signal("gun_fired", player_index, global_position, orientation)
	soundEffect.play(0)