extends World

var enemies:
	set(value):
		enemies = value
		if enemies <= 0:
			portal_open()

func _ready() -> void:
	spawn_enemy("flatten",$EnemySpawn.global_position)
	move_player($PlayerSpawn.global_position)
	$Portal.process_mode = 4
	$Portal.set_deferred("visible", false)
	
	await get_tree().create_timer(20).timeout
	portal_open()
	clear_enemies()
	#unhide portal

func portal_open():
	$Portal.process_mode = 0
	$Portal.set_deferred("visible", true)
	return

func _on_portal_body_entered(body: Node2D) -> void:
	change_worlds(self, "res://scenes/world_apartment.tscn")

func exit():
	clear_enemies()
