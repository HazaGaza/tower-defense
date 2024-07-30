extends PathFollow2D
signal first_turn
var speed = 150
var hp = 50
signal score
func _ready():
	add_to_group("enemy")
# Called when the node enters the scene tree for the first time.

func _process(delta):
	move(delta)
	if progress_ratio == 0.25:
		first_turn.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(delta):
	set_progress(get_progress() + speed * delta )
func on_hit(damage):
	hp -= damage
	if hp <= 0:
		on_destroy()
func on_destroy():
	self.queue_free()
