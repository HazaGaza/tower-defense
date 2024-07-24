extends Node2D
@onready var bullet = preload("res://Prefabs/bullet!.tscn")

func _physics_process(delta):
	turn()
	if Input.is_action_just_pressed("mouse1"):
		shoot()
	var rotation = get_rotation()
func turn():
	var enemy_position = get_global_mouse_position()
	get_node("TowerHead").look_at(enemy_position)
	get_node("TowerHead").rotation_degrees += 90
	var global_var = get_node("TowerHead").get_rotation_degrees()
func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $TowerHead/barrel.global_transform
func _on_sight_area_entered(area):
		if area.is_in_group("enemy"):
			shoot()
