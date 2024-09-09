extends Control
var music = preload("res://Prefabs/audio_stream_player_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var supermusic = music.instantiate()
	add_child(supermusic)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label2").set_text("wave reached =" + str(TopScore.current_wave))


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Prefabs/map_1.tscn")
	self.queue_free()
	TopScore.health = 300
	TopScore.current_wave = 0
	TopScore.score = 0
	TopScore.money = 200
