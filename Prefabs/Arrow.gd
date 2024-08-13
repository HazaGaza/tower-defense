extends Area2D

@export var speed = 25

func _process(delta):
	position.x += speed
