extends Node

func initialize():
	print("YOU DIED")
	$"../../SpriteBody".play("dizzy")
	$"../../SpriteHead".play("dizzy_crownless")
	$"../../SpriteHead".flip_h = $"../../SpriteBody".flip_h
	owner.set_collision_layer_value(1,true)
	return

func active(_killer):
	return
	
func take_damage(_damage):
	return
	
func exit():
	owner.set_collision_layer_value(1,false)
	return
