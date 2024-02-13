extends Area2D

func _on_body_entered(body):
	if body.name == "Player" and self.visible:
		self.visible = false
		print("banana?!")
		get_tree().get_root().get_node("BaseLevel/CanvasLayer/Label").count += 1
