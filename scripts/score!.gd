extends CanvasLayer
var score = 0
var enemy = preload("res://Prefabs/enemy.tscn")
@onready var health_bar = get_node("Healthy")
func _ready():
	get_node("RichTextLabel").set_text("Score = "+str(TopScore.score))
	get_node("money spread").set_text("Money = $"+str(TopScore.money))
	health_bar.max_value = TopScore.health
	health_bar.value = TopScore.health
func _process(delta):
	get_node("RichTextLabel").set_text("Score = "+str(TopScore.score))
	get_node("money spread").set_text("Money = $"+str(TopScore.money))
	health_bar.value = TopScore.health
	get_node("Wave_counter").set_text("Current Wave = "+str(TopScore.current_wave) )
