extends PathFollow2D
class_name enemy1
@onready var enemy_prefab = preload("res://Prefabs/enemy1.tscn")

# Called when the node enters the scene tree for the first time.

func _process(delta):
	progress_ratio +=0.001
# Called every frame. 'delta' is the elapsed time since the previous frame.

