extends Node

var speed = 200
var new_head = preload("res://scenes/player_head.tscn")
var head
var head_active = false


func initialize():
	print("head fell off...")
	
	
	owner.shield = 50
	owner.aggro = false
	$"../../SpriteHead".visible = false
	
	
	
	#spawn in a head that is controlled by the mouse
	if head_active == false:
		head_active = true
		head = new_head.instantiate()
		$"../../..".add_child(head)
		$"../../../PlayerHead/Camera".zoom = $"../../Camera".zoom
		head.global_position = owner.global_position
		head.head_collected.connect(exit)
		head.get_child(-1).make_current()
	
	if $"..".prevstate == $"..".states_dict["dead"]:
		head.get_child(1).play("crownless")
	
	return



func active():
	
	#movement
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	owner.velocity = direction * speed
	owner.move_and_slide()
	
	#animation
	if direction.length() == 0.0: $"../../SpriteBody".play("dizzy")
	else: $"../../SpriteBody".play("dizzyrun")
	
	$"../../SpriteHead".flip_h = owner.global_position.direction_to(owner.get_global_mouse_position()).x >= 0
	if direction.x != 0:
		$"../../SpriteBody".flip_h = direction.x > 0
	return


func take_damage():
	#disable mouse tracking on head, maybe?
	print("dizzy...")
	head.get_child(0).get_child(0).speed = 50
	return



func exit():
	head_active = false
	$"../../Camera".zoom = $"../../../PlayerHead/Camera".zoom
	$"../../SpriteHead".visible = true
	print("got my head back...")
	$"..".state = $"..".states_dict["normal"]
	return
