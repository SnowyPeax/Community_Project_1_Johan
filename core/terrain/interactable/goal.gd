extends Area2D

var has_ended = false

func _on_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.play("pressed")
		Levelmanager.stop_time()


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "pressed" and not has_ended:
		Levelmanager.display_default_end_screen()
		has_ended = true
	if $AnimatedSprite2D.animation != "idle":
		$AnimatedSprite2D.play("idle")
