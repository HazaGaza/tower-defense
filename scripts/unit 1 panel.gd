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
		var mapPath = get_tree().get_root().get_node("map_1/TileMap")

		var tile = mapPath.local_to_map(get_global_mouse_position())
		currTile = mapPath.get_cell_atlas_coords(0, 0,tile)
		if (currTile == Vector2i(6,7)):
			get_child(1).get_node("Area").modulate = Color(0,255,0)
		else:
			get_child(1).get_node("Area").modulate = Color(255,255,255)
	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click released
		print("Left Button Up")
		get_child(1).queue_free()
		var path = get_tree().get_root()
		tempTower.global_position = event.global_position
		path.add_child(tempTower)
		tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
