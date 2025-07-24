extends Node

func initialize():
	print("YOU DIED")
	if $"..".prevstate == $"..".states_dict["flatten"]:
		$"..".state = $"..".states_dict["flatten"]
	elif $"..".prevstate == $"..".states_dict["headless"]:
		get_node("/root/Game/Player/PlayerHead").get_child(1).play("crownless")
	else:
		$"../../SpriteBody".play("dizzy")
		$"../../SpriteHead".play("dizzy_crownless")
	
	$"../../SpriteHead".flip_h = $"../../SpriteBody".flip_h
	owner.set_collision_layer_value(1,true)
	return

func active(_killer):
	return
	
func take_damage(_damage = 0):
	return
	
func exit():
	owner.set_collision_layer_value(1,false)
	return
