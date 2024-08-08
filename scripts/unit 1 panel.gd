extends Panel
@onready var tower = preload("res://Prefabs/TestTower.tscn")
var currTile


func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		#left click clicked
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
		tempTower.scale = Vector2(3,3)
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#left click drag
		get_child(1).global_position = event.global_position
	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click released
		print("Left Button Up")
		get_child(1).queue_free()
		var path = get_tree().get_root()
		tempTower.global_position = event.global_position
		tempTower.scale = Vector2(3,3)
		path.add_child(tempTower)
