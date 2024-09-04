extends CanvasLayer
var score = 0
func _ready():
	get_node("RichTextLabel").set_text("Score = "+str(score))
func _physics_process(delta: float):
	get_node("FPS").set_text("FPS %d" % Engine.get_frames_per_second())
	


func _on_play_next_wave_pressed():
	pass # Replace with function body.
