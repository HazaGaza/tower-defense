extends Node2D

var enemy_array = []

func _physics_process(delta):
	turn()
	
func turn():
	var enemy_position = get_global_mouse_position()
	get_node("TowerHead").look_at(enemy_position)



func _on_sight_body_entered(Area2D):
	enemy_array.append(Area2D.get_parent())
	print(enemy_array)


func _on_sight_body_exited(body):
	enemy_array.erase(body.get_parent())

