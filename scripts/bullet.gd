extends Area2D
class_name bullet
var speed = 750
func _physics_process(delta):
	position += transform.x * speed * delta
func _ready():
	add_to_group("bullet")
func _on_body_entered(body):
	if body.is_in_group("enemy"):
		self.queue_free()
