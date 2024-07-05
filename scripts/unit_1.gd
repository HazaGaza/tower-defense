extends Node2D

func onready():
	var turret = $turret

var enemies

var current_enemy


func _physics_process(delta):
	if enemies != []:
		current_enemy = enemies[0]
		turret.look_at(current_enemy.global_position)

func _on_range_area_entered(area):
	if area.is_in_group("Enemy"):
		enemies.append(range)

func _on_range_area_exited(area):
	if area.is_in_group("Enemy"):
		enemies.erase(range)
