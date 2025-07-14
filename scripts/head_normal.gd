extends Node

var speed = 700

func initialize():
	owner.velocity = Vector2(randf_range(-300,300),randf_range(-400,-500))
	$"../../Camera".global_position = owner.global_position
	return

func active(delta):
	#movement
	var direction = owner.global_position.direction_to(owner.get_global_mouse_position())
	var a = owner.velocity
	owner.velocity = speed*direction*delta + a
	owner.move_and_slide()
	
	owner.up_direction = a + Vector2(0,0.01)
	
	#animation
	owner.rotation += delta*owner.velocity.x*0.015 + owner.velocity.y*0.0001
	return
