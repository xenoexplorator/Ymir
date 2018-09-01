extends Node2D

export (int) var minimum_wait = 1000
export (int) var maximum_wait = 2000
var clock = 0
var health_pack = preload("res://Scenes/HealthPack.tscn")

func _physics_process(delta):
	clock -= 1
	if clock <= 0:
		spawn()
		clock = rand_range(minimum_wait, maximum_wait)

func spawn():
	var x = rand_range(-1500, 1500)
	var y = rand_range(-800, 800)
	var pack = health_pack.instance()
	pack.position = Vector2(x, y)
	add_child(pack)
