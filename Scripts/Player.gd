extends Node

var bullet_scene = preload("res://Scenes/Bullet.tscn")

func _spawn_bullet(player, origin, orientation):
	var bullet = bullet_scene.instance()
	bullet.shoot(origin, orientation)
	add_child(bullet)