extends Control

var music = AudioServer.get_bus_index("Master")
# Called when the node enters the scene tree for the first time.
func _ready():
	$HSlider.value = db_to_linear(music)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music,linear_to_db(value))
