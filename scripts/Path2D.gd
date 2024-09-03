extends Path2D
class_name enemy_path
@onready var path_prefab = preload("res://Prefabs/enemy.tscn")
@onready var path_prefab1 = preload("res://Prefabs/enemy_2.tscn")
var current_wave = 0
var enemies_in_wave = 0
# #enemy types and delay for each wave
var waves = [
	[["enemy", 0.7], ["enemy_2", 0.1]],  # Wave 1
	[["enemy", 0.5], ["enemy", 0.5], ["enemy_2", 0.2]],  # Wave 2
	[["enemy_2", 0.3], ["enemy", 0.4], ["enemy_2", 0.3], ["enemy", 0.2]]  # Wave 3
]

func _ready():
	start_next_wave()

func start_next_wave():
	if current_wave < waves.size():
		var wave_data = retrieve_wave_data()
		await get_tree().create_timer(0.2).timeout  # padding so waves don't start insta
		spawn_enemies(wave_data)
	else:
		print("All waves completed")

func retrieve_wave_data():
	var wave_data = waves[current_wave]
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	for i in wave_data:
		var skibidi = load("res://Prefabs/" + i[0] + ".tscn") as PackedScene
		if skibidi:  # Check if the scene is loaded successfully
			var new_enemy = skibidi.instantiate()
			print(new_enemy)
			add_child(new_enemy)
			await get_tree().create_timer(i[1]).timeout
		else:
			print("Failed to load scene: res://Prefabs/" + i[0] + ".tscn")

