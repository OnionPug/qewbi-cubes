extends StaticBody2D

var up_time = 1.5
var down_time = 0.5
var start_time = 0

const SP_DAMAGE = 500
const HP_DAMAGE = 0
const TYPE = "flatten"

var slamdown : bool = false

func _ready() -> void:
	$Hurtbox/CollisionShape2D.set_deferred("disabled", true)
	return

func start():
	await get_tree().create_timer(start_time).timeout
	piston_move()

func piston_move() -> void:
	if slamdown == true: 
		await get_tree().create_timer(up_time).timeout
	else: 
		await get_tree().create_timer(down_time).timeout
	
	$Hurtbox/CollisionShape2D.disabled = not slamdown
	await get_tree().create_timer(0.05).timeout
	if slamdown == false: z_index = 1
	else: z_index = 0
	
	$Sprite.set_deferred("visible", slamdown)
	$Hitbox.set_deferred("disabled", not slamdown)
	slamdown = not slamdown
	piston_move()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(self, TYPE, SP_DAMAGE, HP_DAMAGE)
