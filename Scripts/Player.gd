extends Node

export (float) var max_hp = 100
var hp = max_hp
var bullet_scene = preload("res://Scenes/Bullet.tscn")

signal player_damage

func _ready():
	get_node("KinematicBody2D/Camera2D").make_current()

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
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func get_score(player_index):
	pass

func _on_heal(amount):
	hp = min(hp + amount, max_hp)
	emit_signal("player_damage", max_hp, hp)
