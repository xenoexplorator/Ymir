extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

var time = 0
var period = 0.3
var magnitude = 200

func shake_camera():
	self.offset = Vector2(rand_range(-magnitude, magnitude), rand_range(-magnitude, magnitude))