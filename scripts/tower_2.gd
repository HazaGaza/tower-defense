extends Node2D
@onready var animated_sprite = $TowerHead
var enemy_array = []
var enemy
var gun_ready = true
var is_shooting: bool = true
func _physics_process(delta):
	if TopScore.health > 0:
		if enemy_array.size() !=0 and is_shooting:
			select_enemy()
			turn()
			if gun_ready == true:
				shoot()
				animated_sprite.play("NOTSOIDLE")
		else:
			enemy = null
	else:
		remove_tower()
func turn():
	get_node("TowerHead/barrel").look_at(enemy.global_position)
func select_enemy() :
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(i.progress)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]
func shoot():
	gun_ready = false
	enemy.on_hit(GameData.missle_tower_data["damage"])
	
	await get_tree().create_timer(GameData.missle_tower_data["rof"]).timeout 
	gun_ready = true
func _on_sight_body_entered(body):
	enemy_array.append(body.get_parent())

func _on_sight_body_exited(body):
	enemy_array.erase(body.get_parent())



func _on_tower_head_animation_finished():
	animated_sprite.play("IDLE")
func remove_tower():
	is_shooting = false  # Stop the shooting logic
	queue_free()
