extends Node2D



var enemies

var current_enemy

<<<<<<< Updated upstream
func _process(delta):
	turn()

func turn():
	var enemy_position = get_global_mouse_position()
	get_node("turret").look_at(enemy_position)

func _on_range_area_entered(area):
	enemy_array.append(area)
	print(enemy_array)

func _on_range_area_exited(area):
	enemy_array.erase(area)
=======
func _physics_process(delta):
	if enemies != []:
		current_enemy = enemies[0]
		turret.look_at(current_enemy.global_position)


>>>>>>> Stashed changes
