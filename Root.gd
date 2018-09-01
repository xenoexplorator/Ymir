extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pop_up_need_more_controllers()
		
func pop_up_need_more_controllers():
	get_node("AcceptDialog").popup_centered()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
