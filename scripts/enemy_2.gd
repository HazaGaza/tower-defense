extends PathFollow2D
var speed = 100
var hp = 150
@onready var health_bar = get_node("CharacterBody2D/healthbar")

func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	add_to_group("enemy")

func _physics_process(delta):
	move(delta)
func move(delta):
	set_progress(get_progress() + speed * delta )
func on_hit(damage):
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		print("sigma")
		self.queue_free()
