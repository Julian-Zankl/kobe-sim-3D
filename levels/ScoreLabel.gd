extends Label

var score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_scored():
	score += 1
	text = "Score: %s" % score

func getScore() -> int:
	return score
