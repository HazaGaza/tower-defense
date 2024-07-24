extends Area2D
class_name enemy
func _ready():
	add_to_group("enemy")
# Called when the node enters the scene tree for the first time.

func _on_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
		queue_free()
