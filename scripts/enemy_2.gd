extends PathFollow2D
var speed = 100
var hp = 80
@onready var health_bar = get_node("CharacterBody2D/health_bar")
@onready var amount = 0
@onready var alive = true
func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	add_to_group("enemy")
	var on_hit = 0

func _physics_process(delta):
	if alive == true:
		move(delta)
func move(delta):
	set_progress(get_progress() + speed * delta )
func on_hit(damage):
	amount += 1
	hp -= damage
	health_bar.value = hp
	print (str(amount)+"alpha")
	if hp <= 0:
		alive == false
		self.queue_free()
