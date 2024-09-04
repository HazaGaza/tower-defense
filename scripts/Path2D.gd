extends Path2D
class_name enemy_path
@onready var path_prefab_easy = preload("res://Prefabs/enemy.tscn")
@onready var path_prefab_hard = preload("res://Prefabs/enemy_2.tscn")
@onready var path_prefab_hardest = preload("res://Prefabs/enemy_3.tscn")
var current_wave = 0
var enemies_in_wave = 0
# Formulas for enemy spawning
func get_easy_enemy_count(wave):
	return 1 * pow(2, wave - 1)

func get_hard_enemy_count(wave):
	return 1 * pow(1.5, wave - 1)

func get_hardest_enemy_count(wave):
	return 0.5 * pow(1.2, wave - 1)

func _ready():
	start_next_wave()

func start_next_wave():
	print("Wave: ", current_wave + 1)
	var wave_data = retrieve_wave_data()
	await get_tree().create_timer(0.2).timeout # Small delay before starting wave
	spawn_enemies(wave_data)
	current_wave += 1

func retrieve_wave_data():
	var wave_data = []
	wave_data.append(["easy", get_easy_enemy_count(current_wave + 1)])
	wave_data.append(["hard", get_hard_enemy_count(current_wave + 1)])
	wave_data.append(["hardest", get_hardest_enemy_count(current_wave + 1)])

func spawn_enemies(wave_data):
	for i in wave_data:
		var enemy_type = i[0]
		var enemy_count = i[1]
		for j in range(int(enemy_count)):
				var new_enemy = null
				if enemy_type == "easy":
					new_enemy = path_prefab_easy.instantiate()
				elif enemy_type == "hard":
					new_enemy = path_prefab_hard.instantiate()
				elif enemy_type == "hardest":
					new_enemy = path_prefab_hardest.instantiate()
				if new_enemy:
					add_child(new_enemy)
					print("Spawned: ", enemy_type, " - Count: ", j + 1)
					await get_tree().create_timer(1.0).timeout # Delay between spawns

func _on_play_next_wave_pressed():
	start_next_wave()
