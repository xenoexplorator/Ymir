extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var tickTillNextSpawn = 0
export (int) var MaxSpawnTime = 150
export (int) var MinSpawnTime = 25

var enemyScene = preload("res://Scenes/Opponent.tscn")


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	tickTillNextSpawn -= delta*100
	if(tickTillNextSpawn <= 0):
		tickTillNextSpawn = rand_range(MinSpawnTime, MaxSpawnTime)
		_spawn_enemy()
		
func _spawn_enemy():
	var node = enemyScene.instance()
	node.get_node("Body").Position_to(self.global_position.x, self.global_position.y)
	add_child(node)
