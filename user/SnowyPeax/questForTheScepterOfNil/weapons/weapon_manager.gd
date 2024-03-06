extends Node2D

var weapon_equiped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func equip(weapon):
	if weapon_equiped:
		get_children()[0].queue_free()
	else:
		weapon_equiped = true
	
	add_child(weapon)
