extends Node

export (float) var max_hp = 100
var hp = max_hp
var bullet_scene = preload("res://Scenes/Bullet.tscn")

signal player_damage

func _spawn_bullet(player, origin, orientation):
	var bullet = bullet_scene.instance()
	bullet.shoot(player, origin, orientation)
	add_child(bullet)

func _take_damage(damage):
	hp -= damage
	emit_signal("player_damage", max_hp, hp)