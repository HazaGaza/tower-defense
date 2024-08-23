extends Node2D
var ui = preload("res://Prefabs/unit_ui.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var superui = ui.instantiate()
	add_child(superui)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func _on_end_body_entered(body):
	body.queue_free()
