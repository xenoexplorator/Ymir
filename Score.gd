extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var playerIndex = -1

func _ready():
	text = GetScore(playerIndex)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func GetScore(index):
	return "blabla"

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
