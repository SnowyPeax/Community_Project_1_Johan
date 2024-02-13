extends Area2D

@export var jump_force = -500



func _on_body_entered(body):
	if body.name == "Player":
		body.velocity.y = jump_force
		print("jumped on jumppad!")
