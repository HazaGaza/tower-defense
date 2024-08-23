extends Path2D
class_name enemy_path
@onready var path_prefab = preload("res://Prefabs/enemy.tscn")
@onready var path_prefab1 = preload("res://Prefabs/enemy2.tscn")
var current_wave = 0
var enemies_in_wave = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	start_next_wave()

func _on_enemy_spawn_timer_timeout():
	var path = path_prefab.instantiate()
	var path1 = path_prefab1.instantiate()
	path.position = Vector2(0,0)
	path1.position = Vector2(0,0)
	add_child(path)
	add_child(path1)
	print("Path created")

func start_next_wave():
	var wave_data = retrieve_wave_data()
	await(get_tree().create_timer(0.2)).timeout # padding so waves dont insta start
	spawn_enemies(wave_data)

func retrieve_wave_data():
	var wave_data = [["enemy", 0.7], ["enemy_2", 0.1]]
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = load("res://Prefabs/enemy" + i[0] + ".tscn").instantiate()
		add_child(new_enemy)
		await(get_tree().create_timer(i[1])).timeout
