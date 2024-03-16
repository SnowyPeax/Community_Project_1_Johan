extends Node2D

@export var hp_vis : HBoxContainer

var hp = 16


func damage(x):
	$AnimationPlayer.play("hit")
	hp -= x
	update_hp()
	
func update_hp():
	var num_hearts = ceil(hp / 4.0)
	var heart_op = (hp % 4) / 4.0
	var i = 0
	for _hp in hp_vis.get_children():
		i += 1
		if _hp.name.contains("hp"):
			if i < num_hearts:
				_hp.modulate.a = 1
			if i == num_hearts:
				if heart_op == 0:
					heart_op = 1
				_hp.modulate.a = heart_op
			if i > num_hearts:
				_hp.modulate = 0
	if hp <= 0:
		Levelmanager.reload_from_checkpoint()
