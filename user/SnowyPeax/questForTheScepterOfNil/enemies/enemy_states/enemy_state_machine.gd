extends Node

@export var default_state : enemy_state

var current_state : enemy_state

func _ready():
	for child in get_children():
		child.state_machine = self
		child.enemy = get_parent()
		child.player = Levelmanager.get_player()
	current_state = default_state
	current_state.enter()

func change_to_state(new_state : String):
	change_to_state_node(get_state(new_state))

func change_to_state_node(new_state : enemy_state):
	current_state.exit()
	current_state = new_state
	current_state.enter()

func get_state(state_name : String):
	return get_node(state_name)
