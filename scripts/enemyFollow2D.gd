extends PathFollow2D
@onready var enemy_prefab = preload("res://Prefabs/enemy1.tscn")
func _ready():
	add_to_group("enemy")
# Called when the node enters the scene tree for the first time.

func _process(delta):
	progress_ratio +=0.001
# Called every frame. 'delta' is the elapsed time since the previous frame.

