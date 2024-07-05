extends Node2D
var ui = preload("res://Prefabs/unit_ui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ui.instantiate()
