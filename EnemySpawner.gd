extends Sprite

var tickTillNextSpawn = 0
export (int) var MaxSpawnTime = 2000
export (int) var MinSpawnTime = 600

var enemyScene = preload("res://Scenes/Opponent.tscn")

func _process(delta):
	tickTillNextSpawn -= delta*100
	if(tickTillNextSpawn <= 0):
		tickTillNextSpawn = rand_range(MinSpawnTime, MaxSpawnTime)
		_spawn_enemy()
		
func _spawn_enemy():
	var player = get_parent().get_node("Player")
	var node = enemyScene.instance()
	var enemy = node.get_node("Body")
	enemy.Position_to(self.global_position.x, self.global_position.y)
	enemy.connect("enemy_death", get_node("../CanvasLayer"), "_on_points_gained")
	node.get_node("Body").Position_to(self.global_position.x, self.global_position.y)
	node.get_node("Body").Set_Player(player.get_node("KinematicBody2D"))
	add_child(node)
