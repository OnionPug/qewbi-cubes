extends Node

func initialize():
	$"../../Sprite".play("flatten")
	owner.rotation = 0
	owner.z_index = -1
	return
	
func active():
	return

func take_damage():
	return

func exit():
	return
