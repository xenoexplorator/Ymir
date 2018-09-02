extends Camera2D

var time = 0
var period = 0.3
var magnitude = 200

func shake_camera():
	self.offset = Vector2(rand_range(-magnitude, magnitude), rand_range(-magnitude, magnitude))