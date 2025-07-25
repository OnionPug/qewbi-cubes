extends Node

var colliding = false
var speed = 50
var struggle_power = 35
var struggle_threshold = 100
var struggle = 0:
	set(value):
		struggle = value
		if struggle < 0:
			struggle = 0
signal escape

#collision layers - collide with all statuses except for flatten and headless

func initialize():
	print("flattened...!")
	
	#initialize sprite
	owner.aggro = false
	owner.z_index = -1
	for x in [$"../../SpriteBody", $"../../SpriteHead"]: 
		x.play("flatten")
		x.flip_h = false
	
	if $"..".prevstate == $"..".states_dict["dead"]:
		$"../../SpriteHead".play("dizzy_flatten")
		struggle_power = 1
		speed = 0
	else:
		struggle_power = 35
		speed = 50
		
	
	$FlattenSound.play()
	owner.set_collision_mask_value($"..".layer_dict["flatten"],true)
	$"../../Hitbox".shape.height = 70
	
	
	#escape condition
	await escape
	if $"..".prevstate != $"../../EffectStates".states_dict["flatten"]:
		$"..".state = $"..".prevstate
	return


func active():
	#movement
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	owner.velocity = direction * speed
	owner.move_and_slide()
	
	for x in ["move_left","move_right","move_up","move_down"]:
		if Input.is_action_just_pressed(x) == true:
			struggle += struggle_power
	if struggle > 0: 
		for x in [$"../../SpriteBody", $"../../SpriteHead"]: x.position = Vector2(randf_range(-1,1),randf_range(-1,1))
	else: 
		for x in [$"../../SpriteBody", $"../../SpriteHead"]: x.position = Vector2(0,0)
	
	if struggle >= struggle_threshold and colliding == false:
		escape.emit()
	else: struggle -= 5

#makes everything much harder for the player, but still theoretically recoverable
func take_damage(damage = 0):
	struggle -= damage
	print("flattened again...")
	speed = 0
	struggle_threshold = 175
	$"../../SpriteBody".scale.x = 0.28
	$FlattenSound.pitch_scale = 0.9
	$FlattenSound.play()
	return


func exit():
	struggle = 0
	speed = 50
	struggle_threshold = 100
	$"../../SpriteBody".scale.x = 0.23
	owner.set_collision_mask_value($"..".layer_dict["flatten"],false)
	$"../../Hitbox".shape.height = 48
	$FlattenSound.pitch_scale = 1
	owner.z_index = 0
	owner.aggro = true


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Hazards"):
		colliding = true
	pass # Replace with function body.


func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.is_in_group("Hazards"):
		colliding = false
	pass # Replace with function body.
