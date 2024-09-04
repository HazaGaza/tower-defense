extends CanvasLayer
var score = 0
var enemy = preload("res://Prefabs/enemy.tscn")
func _ready():
	get_node("RichTextLabel").set_text("Score = "+str(TopScore.score))
func _physics_process(delta: float):
	get_node("FPS").set_text("FPS %d" % Engine.get_frames_per_second())

func _process(delta):
	get_node("RichTextLabel").set_text("Score = "+str(TopScore.score))

func _on_play_next_wave_pressed():
	pass # Replace with function body.
	enemy.get_node("mobs").death.connect(self.on_death)


