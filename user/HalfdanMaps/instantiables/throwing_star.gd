extends Area2D

var speed = 800
var direction = Vector2.RIGHT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * direction * delta




func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.get_collision_layer_value():
		pass
