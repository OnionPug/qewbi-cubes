extends Node

func initialize():
	print("YOU DIED")
	$"../../SpriteBody".play("dizzy")
	$"../../SpriteHead".play("dizzy_crownless")
	$"../../SpriteHead".flip_h = $"../../SpriteBody".flip_h
	return

func active(_killer):
	return
	
func take_damage(_damage):
	return
	
func exit():
	
	return
