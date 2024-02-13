extends Area2D



func _ready():
	get_tree().get_root().get_node("BaseLevel/CanvasLayer/Label").number_of_bananas += 1

func _on_body_entered(body):
	if body.name == "Player" and self.visible:
		self.visible = false
		print("banana?!")
		get_tree().get_root().get_node("BaseLevel/CanvasLayer/Label").count += 1
