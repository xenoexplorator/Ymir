extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const MAINMENU_SCENE_PATH = "res://Root.tscn"

func _ready():
	grab_focus()
	pass

func returnToMainMenu():
	get_tree().change_scene(MAINMENU_SCENE_PATH)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
