extends Node2D
@onready var bullet = preload("res://Prefabs/bullet!.tscn")
@onready var animated_sprite = $TowerHead
@onready var arrow = preload("res://Prefabs/bullet!.tscn")
var enemy_array = []
var enemy
var gun_ready = true
func _physics_process(delta):
	if enemy_array.size() !=0:
		select_enemy()
		turn()
		if gun_ready == true:
			animated_sprite.play("Firing") 
			arrow.instantiate()
			arrow.position = 
			get_parent().add_child(arrow)
			shoot()
	else:
		enemy = null
func turn():
	get_node("TowerHead").look_at(enemy.global_position)
	get_node("TowerHead/barrel").look_at(enemy.position)
	get_node("TowerHead").rotation_degrees += 90
func select_enemy() :
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.progress)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]
func shoot():
	gun_ready = false
	enemy.on_hit(GameData.tower_data_["damage"])
	await get_tree().create_timer(GameData.tower_data_["rof"]).timeout
	gun_ready = true
func _on_sight_body_entered(body):
	enemy_array.append(body.get_parent())

func _on_sight_body_exited(body):
	enemy_array.erase(body.get_parent())
