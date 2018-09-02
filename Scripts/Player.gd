extends Node

export (float) var max_hp = 100
var hp = max_hp
var bullet_scene = preload("res://Scenes/Bullet.tscn")
var upgrade_timer = [ 0, 0 ]

signal player_damage
signal buff_player(player, duration)

func _ready():
	get_node("KinematicBody2D/Camera2D").make_current()

func _spawn_bullet(player, origin, orientation):
	var bullet = bullet_scene.instance()
	bullet.shoot(player, origin, orientation)
	add_child(bullet)
	if upgrade_timer[player] > 0:
		for t in [-0.24, -0.12, 0.12, 0.24]:
			var dt = rand_range(-0.03, 0.03)
			var dv = rand_range(-1, 1)
			var b = bullet_scene.instance()
			b.shoot(player, origin, orientation + t + dt)
			b.speed += dv
			add_child(b)

func _take_damage(damage):
	hp -= damage
	emit_signal("player_damage", max_hp, hp)
	if hp <= 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func get_score(player_index):
	pass

func _on_heal(amount):
	hp = min(hp + amount, max_hp)
	emit_signal("player_damage", max_hp, hp)

func upgrade(player_index, duration):
	upgrade_timer[player_index] = duration
	emit_signal("buff_player", player_index, duration)

func _physics_process(delta):
	if upgrade_timer[0] > 0:
		upgrade_timer[0] -= 1
	if upgrade_timer[1] > 0:
		upgrade_timer[1] -= 1
