extends Node2D
@onready var bullet = preload("res://Prefabs/bullet!.tscn")
var enemy_array = []
var enemy
var gun_ready = true
func _physics_process(delta):
	if enemy_array.size() !=0:
		select_enemy()
		turn()
		if gun_ready == true:
			shoot()
	else:
		enemy = null
func turn():
	get_node("TowerHead").look_at(enemy.position)
	var global_var = get_node("TowerHead").get_rotation_degrees()
	print(global_var)
func select_enemy() :
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.progress)
	var max_progress = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_progress)
	enemy = enemy_array[enemy_index]
func shoot():
	gun_ready = false
	enemy.on_hit(GameData.tower_data_["damage"])
	await(get_tree().create_timer(GameData.tower_data_["rof"]))
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $TowerHead/barrel.global_transform
	gun_ready = true
func _on_sight_area_entered(area):
		if area.is_in_group("enemy"):
			shoot()
func my_click_function():
	var player_area = get_node("Sight")
	if player_area.overlaps_body(self):
		shoot()


func _on_sight_body_entered(body):
	enemy_array.append(body.get_parent())
	print(enemy_array)

func _on_sight_body_exited(body):
	enemy_array.erase(body.get_parent())
