extends Area2D

@export var demand = 2

signal basket_filled


func _on_body_entered(body):
	if body.editor_description == "basketable":
		demand -= 1
		body.collect()
		
		if demand == 0:
			get_node("Locked").trigger()
			queue_free()
