extends CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready():
	var score = TopScore.score
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var score = TopScore.score
	get_node("RichTextLabel").set_text("Score = "+str(score))
