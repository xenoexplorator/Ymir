extends Sprite

export (int) var fire_delay = 3
var heat = 0
signal gun_fired
var soundEffect

func _ready():
	soundEffect = get_node("Sound")

func _physics_process(delta):
	if heat > 0:
		heat -= 1

func fire(player_index, orientation):
	if (heat > 0):
		return
	heat = fire_delay
	emit_signal("gun_fired", player_index, global_position, orientation)
	soundEffect.play(0)
