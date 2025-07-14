extends Node

var speed = 500



func initialize():
	#reset changes made by other states
	print("normal again!")
	owner.set_collision_mask_value($"..".layer_dict["normal"],true)
	owner.shield = 100
	owner.aggro = true
	$"../../SpriteHead".visible = true
	$"../../SpriteBody".visible = true
	return

func active():
	#movement
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	owner.velocity = direction * speed
	owner.move_and_slide()
	
	#Sprite and animations
	if direction.length() == 0.0:
		for x in [$"../../SpriteBody", $"../../SpriteHead"]: x.play("idle")
	else:
		for x in [$"../../SpriteBody", $"../../SpriteHead"]: x.play("run")
	
	$"../../SpriteHead".flip_h = owner.global_position.direction_to(owner.get_global_mouse_position()).x >= 0
	if direction.x != 0: $"../../SpriteBody".flip_h = direction.x > 0

func take_damage():
	owner.shield = 100
	return

func exit():
	owner.set_collision_mask_value($"..".layer_dict["normal"],false)
	return
