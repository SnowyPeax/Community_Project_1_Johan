extends Area2D

@export var shuriken : PackedScene

@onready var anim = $AnimationPlayer

@onready var player = Levelmanager.get_player()

@onready var delay = $delay

@export var posy = 0

var hp = 80.0
var max_hp = 80.0

var delay_time = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")
	set_process(false)

func _physics_process(delta):
	if $AnimationPlayer.assigned_animation == "slam":
		position.y = posy

func tp_above():
	posy = -80
	position.x = player.position.x
	set_process(true)

var last_attack = ""
func choose_attack():
	var available_attacks = ["dash", "slam", "throw_upper", "throw"]
	available_attacks.remove_at(available_attacks.find(last_attack))
	var chosen_attack = available_attacks.pick_random()
	last_attack = chosen_attack
	
	if chosen_attack != "slam":
		if player.global_position.x > 0:
			chosen_attack = chosen_attack + "_left"
		else:
			chosen_attack = chosen_attack + "_right"
	return chosen_attack

func throw_shuriken(is_right: bool):
	for r in [-30, -15, 0, 15, 30]:
		var s = shuriken.instantiate()
		var dir_to_player = (player.global_position - global_position).normalized().rotated(deg_to_rad(r))
		s.global_position = global_position + dir_to_player * 30
		s.direction = dir_to_player
		s.drops = true
		get_tree().root.add_child(s)


var last_anim = ""
func _on_animation_player_animation_finished(anim_name):
	if hp > 0:
		last_anim = anim_name
		delay.start(delay_time)


func _on_delay_timeout():
	if last_anim != "tp_away":
		$AnimationPlayer.play("tp_away")
	else:
		monitorable = true
		$AnimationPlayer.play(choose_attack())


func _on_claws_right_body_entered(body):
	if body.name == "Player":
		body.get_node("DamageHandler").damage(2)

var has_ended = false
func damage(x):
	hp -= x
	$AnimationPlayer2.play("hit")
	$CanvasLayer/VBoxContainer/ProgressBar.value = (hp / max_hp) * 100.0
	if hp <= 0 and not has_ended:
		$AnimatedSprite2D.visible = false
		$GPUParticles2D2.emitting = true
		Levelmanager.display_default_end_screen()
		has_ended = true
