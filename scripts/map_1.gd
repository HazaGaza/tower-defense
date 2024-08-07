extends Node2D
var ui = preload("res://Prefabs/unit_ui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Corner1").add_to_group("corner")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	ui.instantiate()


func _on_corner_1_body_entered(body):
	print(body)
