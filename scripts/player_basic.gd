extends CharacterBody2D

#code exclusively for movement of this specific player body

#cannot be replenished by any means
var health = 5
#restores after every recovery
var shield = 100
#toggles enemy aggression
var aggro = true:
	set(value):
		aggro = value
		ai_off.emit()
signal ai_off
#gets name of killer
var killer


func take_damage(attacker, type, sp_damage, hp_damage):
	var state = $EffectStates.state
	var states_dict = $EffectStates.states_dict
	shield -= sp_damage
	if shield <= 0:
		health -= hp_damage
		if state in [states_dict["normal"], states_dict["headless"], states_dict["dead"]]:
			$EffectStates.state = states_dict[type]
		elif state == states_dict[type]:
				state.take_damage(sp_damage)
		if health <= 0:
			killer = attacker
			$EffectStates.state = states_dict['dead']
