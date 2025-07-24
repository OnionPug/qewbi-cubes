extends World


func _ready() -> void:
	$PistonHazard.down_time = 1
	$PistonHazard.up_time = 1.5
	$PistonHazard.start()
	
	move_player($PlayerSpawn.global_position)

func _on_portal_body_entered(body: Node2D) -> void:
	if body.name == "PlayerBasic":
		change_worlds(self, "res://scenes/world_1_1.tscn")
	return
