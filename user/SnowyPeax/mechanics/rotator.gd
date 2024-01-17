extends Area2D

@export var new_rotation: int

func _ready():
	$Sprite2D.rotation_degrees = -new_rotation

func _on_body_entered(body):
	get_parent().rotation_degrees = new_rotation
