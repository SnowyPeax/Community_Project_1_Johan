extends Area2D

@export var base_damage = 1

var velocity = Vector2.ZERO

var system_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	velocity.y += system_gravity * delta
	
	position += velocity * delta
	look_at(position + velocity)

func calculate_damage():
	return base_damage * (velocity.length() / 100) # damage depends on velocity

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(calculate_damage())
	
	if body != Levelmanager.get_player():
		queue_free()
