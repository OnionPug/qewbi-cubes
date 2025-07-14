extends StaticBody2D

var slamdown : bool = false

const SP_DAMAGE = 500
const HP_DAMAGE = 0
const TYPE = "flatten"

func _ready() -> void:
	_on_timer_timeout()
	return

func _on_timer_timeout() -> void:
	if slamdown == false: z_index = 1
	else: z_index = 0
	$Hurtbox/CollisionShape2D.disabled = not slamdown
	$Sprite.set_deferred("visible", slamdown)
	await get_tree().create_timer(0.05).timeout
	$Hitbox.set_deferred("disabled", not slamdown)
	slamdown = not slamdown
	


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(self, TYPE, SP_DAMAGE, HP_DAMAGE)
