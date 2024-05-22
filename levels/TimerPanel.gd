extends Panel

@onready var timer = $Timer
var minutes: int = 0
var seconds: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()

func timeLeft():
	var time = timer.time_left
	minutes = floor(time / 60)
	seconds = int(time) % 60
	return [minutes, seconds]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLeft()
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d" % seconds
	
