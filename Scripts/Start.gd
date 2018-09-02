extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"<
const ARENA_SCENE_PATH = "res://Scenes/Arena.tscn"
const TUTORIAL_SCENE_PATH = "res://Scenes/Tutorial.tscn"
const MAINMENU_SCENE_PATH = "res://MainMenu.tscn"

signal startGame

func _ready():
	get_node("StartButton").grab_focus()
	if(global.game_started == true):
		set_scores()

func set_scores():
	get_node("Player1/Score").text = "%06d" % global.player_1_score
	get_node("Player2/Score").text = "%06d" % global.player_2_score
	if(global.player_1_score > global.player_2_score):
		get_node("Winner").text = "Player 1!"
	elif(global.player_1_score < global.player_2_score):
		get_node("Winner").text = "Player 2!"
	else:
		get_node("Winner").text = "In you all along! (Sorry, it's a tie)"

func _on_Start_button_up():
	global.game_started = true
	emit_signal("startGame")
	get_tree().change_scene(ARENA_SCENE_PATH)

func _on_Tutorial_button_up():
	get_tree().change_scene(TUTORIAL_SCENE_PATH)

func _on_Quit_button_up():
	get_tree().quit()

func _on_MainMenu_button_up():
	get_tree().change_scene(MAINMENU_SCENE_PATH)
