extends Path2D
class_name enemy2
@onready var path_prefab = preload("res://Prefabs/path_follow_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_enemy_spawn_timer_timeout():
	var path = path_prefab.instantiate()
	path.position = Vector2(0,0)
	add_child(path)
	print("Path created")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
