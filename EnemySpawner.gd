extends Sprite

var tickTillNextSpawn = 0
export (int) var MaxSpawnTime = 150
export (int) var MinSpawnTime = 25

var enemyScene = preload("res://Scenes/Opponent.tscn")

func _process(delta):
	tickTillNextSpawn -= delta*100
	if(tickTillNextSpawn <= 0):
		tickTillNextSpawn = rand_range(MinSpawnTime, MaxSpawnTime)
		_spawn_enemy()
		
func _spawn_enemy():
	var node = enemyScene.instance()
	var enemy = node.get_node("Body")
	enemy.Position_to(self.global_position.x, self.global_position.y)
	enemy.connect("enemy_death", get_node("../CanvasLayer"), "_on_points_gained")
	add_child(node)
