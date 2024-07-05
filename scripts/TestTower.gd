extends Node2D

func onready():
	var Head = $TowerHead

var enemies = []

var current_enemy

func _physics_process(delta):
	if enemies != []:
		var Head = $TowerHead
		current_enemy = enemies[0]
		Head.look_at(current_enemy.global_position)

func _on_sight_area_entered(area):
	if area.is_in_group("Enemy"):
		enemies.append(area)

func _on_sight_area_exited(area):
	if area.is_in_group("Enemy"):
		enemies.erase(area)
