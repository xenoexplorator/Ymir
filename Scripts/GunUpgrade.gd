extends Area2D

export (int) var duration = 15

func _physics_process(delta):
	var overlap = get_overlapping_bodies()
	for body in overlap:
		if body.has_method("upgrade_gun"):
			body.upgrade_gun(duration)
			duration = 0
			queue_free()