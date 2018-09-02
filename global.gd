extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player_1_score = 0
var player_2_score = 0
var game_started = false
var messagePoped = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
