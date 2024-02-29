extends Area2D

var velocity = Vector2.ZERO

var system_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	velocity.y += system_gravity * delta
	
	position += velocity * delta
	look_at(position + velocity)

func _on_body_entered(body):
	if body != Levelmanager.get_player():
		queue_free()
