extends Node
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _on_path_follow_2d_score():
	score += 1
	print("sigma")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
