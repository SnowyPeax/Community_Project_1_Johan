extends Node2D

class_name BaseLevel

func _on_body_entered(body):
	if body.name == "Player":
		body.velocity.y = -300
		print("collided!")
