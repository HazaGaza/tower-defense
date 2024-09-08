extends PathFollow2D
var speed = 100
var hp = 80
@onready var animated_sprite = $CharacterBody2D/AnimatedSprite2D
@onready var health_bar = get_node("CharacterBody2D/health_bar")
func _ready():
	health_bar.max_value = hp
	health_bar.value = hp
	add_to_group("enemy")
	animated_sprite.flip_h = true
	animated_sprite.play("fly_left")
func _physics_process(delta):
	move(delta)
func move(delta):
	set_progress(get_progress() + speed * delta )
func on_hit(damage):
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		self.queue_free()
		print("dead")
		TopScore.score += 3
		TopScore.money += 150



func _on_corner_1_timeout():
	animated_sprite.stop()
	animated_sprite.rotation_degrees -= 90
	animated_sprite.play("fly_down")

func _on_corner_2_timeout():
	animated_sprite.stop()
	animated_sprite.flip_h = false
	animated_sprite.rotation_degrees -= 90
	animated_sprite.play("fly_left")

func _on_corner_3_timeout():
	animated_sprite.stop()
	animated_sprite.rotation_degrees += 90
	animated_sprite.play("fly_down")

func _on_corner_4_timeout():
	animated_sprite.stop()
	animated_sprite.flip_h = true
	animated_sprite.rotation_degrees += 90
	animated_sprite.play("fly_left")

func _on_corner_5_timeout():
	animated_sprite.stop()
	animated_sprite.rotation_degrees += 90
	animated_sprite.play("fly_up")

func _on_corner_6_timeout():
	animated_sprite.stop()
	animated_sprite.rotation_degrees += 90
	animated_sprite.flip_h = false
	animated_sprite.flip_v = true
	animated_sprite.play("fly_left")
