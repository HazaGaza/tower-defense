extends PathFollow2D
@onready var enemy_prefab = preload("res://Prefabs/enemy1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy = enemy_prefab.instantiate()
	enemy.position = Vector2(0,0)
	add_child(enemy)
	print("Sigma Spawn")

func _process(delta):
	progress_ratio +=0.001
# Called every frame. 'delta' is the elapsed time since the previous frame.

