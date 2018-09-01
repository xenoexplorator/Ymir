extends Sprite


func _on_Player_player_damage(maxhp, hp):
	scale = Vector2(hp / maxhp, 1)
