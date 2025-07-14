extends CharacterBody2D

#cannot be replenished by any means
var health = 1
#restores after every recovery
var shield = 500
#toggles enemy aggression
var aggro = true:
	set(value):
		aggro = value
		ai_off.emit()
signal ai_off
signal head_collected

func take_damage(_attacker, type, sp_damage, _hp_damage):
	var state = $EffectStates.state
	var states_dict = $EffectStates.states_dict
	shield -= sp_damage
	if shield <= 0:
		print("hit")
		health = 0
		if state in [states_dict["normal"], states_dict["flatten"]]:
			$EffectStates.state = states_dict[type]
		elif state == states_dict[type]:
				state.take_damage(sp_damage)
				



func _on_area_2d_body_entered(body: Node2D) -> void:
	var E_states = body.get_child(0)
	#head can only be collected if no other status conditions have been applied
	if body.is_in_group("Player") and body.name == "PlayerBasic" and E_states.state == E_states.states_dict["headless"]:
		head_collected.emit()
		queue_free()
	pass # Replace with function body.
