extends Area2D
class_name bullet
var speed = 750
func _physics_process(delta):
	position += transform.x * speed * delta
func _ready():
	add_to_group("bullet")
	get_node("AnimatedSprite2d").rotation_degrees += 90
	get_node("bullet!").rotation_degrees += 90


