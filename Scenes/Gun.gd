extends Sprite

export (int) var rate_of_fire = 3
var heat = 0
signal gun_fired

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func fire(player_index, orientation):
	heat += 1
	if (heat < rate_of_fire):
		return
	heat -= rate_of_fire
	var g_trans = get_global_transform()
	var origin = global_position
	var off = offset.rotated(orientation) * g_trans.get_scale()
	emit_signal("gun_fired", player_index, origin, orientation)