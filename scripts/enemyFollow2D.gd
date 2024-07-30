extends PathFollow2D
@onready var enemy_prefab = preload("res://Prefabs/enemy1.tscn")
signal first_turn
func _ready():
	add_to_group("enemy")
# Called when the node enters the scene tree for the first time.

func _process(delta):
	progress_ratio +=0.001
	print(progress_ratio)
	if progress_ratio == 0.25:
		first_turn.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.

