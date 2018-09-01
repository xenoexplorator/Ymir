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
	if hp <= 0:
		kill_player()

func kill_player():
	get_tree().change_scene("res://MainMenu.tscn")
	get_viewport().canvas_transform.origin = Vector2()


func _on_heal(amount):
	hp = min(hp + amount, max_hp)
	emit_signal("player_damage", max_hp, hp)
