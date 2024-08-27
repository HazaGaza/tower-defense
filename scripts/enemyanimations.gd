extends Node
@onready var enemy = get_tree().get_root().get_node("CharacterBody2D/AnimatedSprite2D")
@onready var enemy2 = preload("res://Prefabs/enemy_2.tscn")

func _ready():
	enemy.play("fly_right")
	

