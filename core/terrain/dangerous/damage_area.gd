extends Area2D

class_name damage_area

@export var damage = 1
@export var disabled = false


func _ready():
	monitoring = !disabled


func _on_body_entered(body):
	if body.has_method("die"):
		body.die()
