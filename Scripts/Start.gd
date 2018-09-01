extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"<
const ARENA_SCENE_PATH = "res://Scenes/Arena.tscn"
const TUTORIAL_SCENE_PATH = ""

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_Start_button_up():
	get_tree().change_scene(ARENA_SCENE_PATH)
	
func _on_Tutorial_button_up():
	get_tree().change_scene(TUTORIAL_SCENE_PATH)
	
func _on_Quit_button_up():
	get_tree().quit()