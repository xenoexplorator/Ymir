extends CanvasLayer

var player_scores = [ 0, 0 ]
var player_score_labels = [ ]

func _ready():
	player_score_labels.push_back(get_node("LabelScoreP1/Score1"))
	player_score_labels.push_back(get_node("LabelScoreP2/Score2"))

func _on_points_gained(player_index, points):
	player_scores[player_index] += points
	player_score_labels[player_index].text = "%06d" % player_scores[player_index]
