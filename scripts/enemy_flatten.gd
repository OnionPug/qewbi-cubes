extends Enemy



var player = null
var direction = Vector2(0,0)
var a = Vector2(0,0)
var accel = false:
	set(value):
		if value != accel:
			if value:
				sp_damage = 100
				await get_tree().create_timer(0.5).timeout
			else:
				sp_damage = 0
			accel = value




func _ready():
	speed = 15
	ai_off = false
	hp_damage = 1
	effect = 'flatten'
	


func _physics_process(delta: float) -> void:
	if player != null:
		ai_off = not player.aggro
		if ai_off == false:
			direction = self.global_position.direction_to(player.global_position)
		else:
			velocity = a*0.95
	
	a = velocity
	
	if accel == true:
		velocity = direction * delta * speed + a
	else:
		velocity = a*0.90
	
	accel = (velocity.length()-a.length()) >= -0.05
	
	var collision_info = move_and_collide(velocity)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		accel = false
	


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(self,effect,sp_damage,hp_damage)


func _on_detection_body_entered(body: Node2D) -> void:
	if "aggro" in body:
		if body.aggro == true:
				player = body

func take_damage(hit_damage, hit_effect):
	health -= hit_damage
	if health <= 0:
		var world = get_node("/root/Game/World").get_child(0)
		if "enemies" in world:
			world.enemies -= 1
		queue_free()
		#signal to the world that it died
	return
