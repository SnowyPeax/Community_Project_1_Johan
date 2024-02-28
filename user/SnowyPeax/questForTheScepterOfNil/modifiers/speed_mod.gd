extends Area2D

@export var modifier = 1.2

@onready var player

func _ready():
	player = Levelmanager.get_player()

func _on_body_entered(body):
	if body == player:
		player.speed *= modifier
		queue_free()
