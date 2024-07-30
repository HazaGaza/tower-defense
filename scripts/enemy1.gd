extends CharacterBody2D
class_name enemy

func _ready():
	add_to_group("enemy")
	get_node("AnimatedSprite2D").play("Fly right")
# Called when the node enters the scene tree for the first time.

func _on_timer_timeout():
	get_node("AnimatedSprite2D").rotation_degrees -= 90
	get_node("AnimatedSprite2D").play("Fly down")

func _on_path_follow_2d_first_turn():
	get_node("AnimatedSprite2D").play("Fly right")
	get_node("AnimatedSprite2D").flip_h



func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
		queue_free()
