extends Node

class_name state

var state_machine = null
var player : player= null

func _ready():
	exit()

func enter():
	set_physics_process(true)
	set_process_input(true)
	on_state_entered()

func on_state_entered():
	pass

func exit():
	set_physics_process(false)
	set_process_input(false)
	on_state_exited()

func on_state_exited():
	pass

