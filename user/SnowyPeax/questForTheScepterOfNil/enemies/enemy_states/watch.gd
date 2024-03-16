extends enemy_state

@export var watch_area : Area2D

func _ready():
	watch_area.body_entered.connect(_on_area_2d_body_entered)


func _on_area_2d_body_entered(body):
	if body == player:
		state_machine.change_to_state("Ascend")
