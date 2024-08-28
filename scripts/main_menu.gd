extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass


func _on_play_pressed():
	# Queue the current scene to free on the next frame:
	var root_node = get_tree().get_root()
	# Load in some scene from our project files:
	var new_scene_resource = load("res://Prefabs/map_1.tscn") # Load the new level from disk
	var new_scene_node = new_scene_resource.instantiate() # Create an actual node of it for the game to use
	root_node.add_child(new_scene_node) # Add to the tree so the level starts processing
	var scene_node = get_tree().get_root().get_node("Base_map/main_menu_ui")
	scene_node.queue_free()


func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	pass # Replace with function body.


func _on_credits_pressed():
	pass # Replace with function body.
