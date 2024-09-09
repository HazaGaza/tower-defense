extends Node2D
var ui = preload("res://Prefabs/unit_ui.tscn")
var music = preload("res://Prefabs/audio_stream_player_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var superui = ui.instantiate()
	add_child(superui)
	var supermusic = music.instantiate()
	add_child(supermusic)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if TopScore.health <=0:
		get_tree().change_scene_to_file("res://Prefabs/game_over.tscn")
		self.free()


# This function reduces the player's HP and checks if it reaches zero

func _on_end_body_entered(body):
	body.queue_free()
	print(body.get_parent().hp)
	var damage = body.get_parent().hp
	TopScore.health -=damage
