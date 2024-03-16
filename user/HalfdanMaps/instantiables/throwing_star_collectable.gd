extends RigidBody2D

var addable = true

func _on_area_2d_body_entered(body):
	var n = Levelmanager.get_player().get_node("ThrowingStars")
	if n != null:
		if addable:
			n.add_throwing_star()
			addable = false
	queue_free()
