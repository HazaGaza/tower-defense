extends CanvasLayer
var score = 0
func _ready():
		get_node("RichTextLabel").set_text("Score = "+str(score))
func _on_enemy_death():
	score += 1
	get_node("RichTextLabel").set_text("Score = "+str(score))
