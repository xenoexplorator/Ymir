extends Area2D

export (int) var power = 15

func _physics_process(delta):
	var overlap = get_overlapping_bodies()
	for body in overlap:
		if body.has_method("heal"):
			body.heal(power)
			power = 0
			queue_free()
