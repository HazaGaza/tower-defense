extends PathFollow2D
var speed = 150
var hp = 40
signal death
@onready var animated_sprite = $CharacterBody2D/AnimatedSprite2D
@onready var health_bar = get_node("CharacterBody2D/healthbar")
func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	add_to_group("enemy")
	animated_sprite.play("fly_right")
func _physics_process(delta):
	move(delta)
func move(delta):
	set_progress(get_progress() + speed * delta )
func on_hit(damage):
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		self.queue_free()
		TopScore.score += 1
		TopScore.money += 50

func _on_corner_1_timeout():
	animated_sprite.stop()
	
	animated_sprite.play("fly_down")
