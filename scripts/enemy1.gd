extends Area2D
class_name enemy
func _ready():
	add_to_group("enemy")
	get_node("AnimatedSprite2D").play("Fly right")
# Called when the node enters the scene tree for the first time.


func _on_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
		queue_free()

func _on_timer_timeout():
	self.wait__time = 2
	get_node("AnimatedSprite2D").rotation_degrees -= 90
	get_node("AnimatedSprite2D").play("Fly down")
	get_node("AnimatedSprite2D").play("Fly right")
	
