extends Area2D

@export var collectable : PackedScene


var speed = 800
var direction = Vector2.RIGHT


var last_delta = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	last_delta = delta
	position += speed * direction * delta




func _on_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if body.name == "Player":
		pass
	else:
		var c = collectable.instantiate()
		c.global_position = global_position - (speed * direction * last_delta * 1)
		
		c.apply_force(-speed * direction * last_delta * 1000 + Vector2(0, -10000))
		get_tree().root.add_child(c)
		queue_free()
		
