extends CanvasLayer

export (float) var buff_scale_factor = 900.0
var player_scores = [ 0, 0 ]
var player_score_labels = [ ]
var buff_durations = [ 0, 0 ]
var buff_bars = [ ]

func _ready():
	player_score_labels.push_back(get_node("LabelScoreP1/Score1"))
	player_score_labels.push_back(get_node("LabelScoreP2/Score2"))
	buff_bars.push_back(get_node("PowerUpBarP1"))
	buff_bars.push_back(get_node("PowerUpBarP2"))
	buff_bars[0].scale = Vector2(0, 0.5)
	buff_bars[1].scale = Vector2(0, 0.5)

func _on_points_gained(player_index, points):
	player_scores[player_index] += points
	global.player_1_score = player_scores[0]
	global.player_2_score = player_scores[1]
	player_score_labels[player_index].text = "%06d" % player_scores[player_index]

func _physics_process(delta):
	buff_bars[0].scale = Vector2(max(float(buff_durations[0]) / buff_scale_factor, 0), 0.5)
	buff_durations[0] -= 1
	buff_bars[1].scale = Vector2(max(float(buff_durations[1]) / buff_scale_factor, 0), 0.5)
	buff_durations[1] -= 1

func _on_buff_player(player, duration):
	buff_durations[player] = duration
