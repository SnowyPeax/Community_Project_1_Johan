extends Area2D

@export var modifier = 1.1

@onready var player

func _ready():
	player = Levelmanager.get_player()

func _on_body_entered(body):
	if body == player:
		player.jump_velocity *= modifier
		queue_free()
