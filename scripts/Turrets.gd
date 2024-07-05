extends Node2D

var enemy_array = []
var built = false

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
