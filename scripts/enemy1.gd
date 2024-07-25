extends Area2D
class_name enemy
func _ready():
	add_to_group("enemy")
# Called when the node enters the scene tree for the first time.

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var TimeInSeconds = 5

func _process(delta):
	anim.play("Fly right")
	if TimeInSeconds > 0:
		TimeInSeconds -= delta
		self.position.x += 1 * delta



func _on_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
		queue_free()

