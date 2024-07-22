extends Node2D

func onready():
	var Head = $TowerHead

var enemies = []

var current_enemy

func _physics_process(delta):
	turn()
	
func turn():
	var enemy_position = get_global_mouse_position()
	get_node("TowerHead").look_at(enemy_position)
