extends Node

var basic_cooldown = 0.4
var cooldown = false

func basic():
	if cooldown == false:
		print("pew")
		cooldown = true
		await get_tree().create_timer(basic_cooldown).timeout
		cooldown = false
