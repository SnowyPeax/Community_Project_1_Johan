extends Area2D

func _ready():
	if Levelmanager.get_checkpoint_position() == global_position:
		play_anim("idle")
		Levelmanager._checkpoint = self

func _on_body_entered(body):
	if body == Levelmanager.get_player() && Levelmanager.get_checkpoint_position() != global_position:
		var checkpoint = Levelmanager.get_checkpoint()
		if is_instance_valid(checkpoint):
			checkpoint.play_anim("no_flag")
		Levelmanager._checkpoint_pos = global_position
		Levelmanager._checkpoint = self
		play_anim("out")

func play_anim(animation_name : String):
	$AnimatedSprite2D.play(animation_name)

func _on_animated_sprite_2d_animation_finished():
	play_anim("idle")
