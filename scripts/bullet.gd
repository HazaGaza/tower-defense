extends Area2D
class_name bullet
var speed = 750
func _physics_process(delta):
	position -= transform.y * speed * delta
func _ready():
	add_to_group("bullet")
	get_node("Sprite2D").rotation_degrees += 90
