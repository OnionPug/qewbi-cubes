extends World

func _ready() -> void:
	clear_enemies()
	$PistonHazard/Timer.wait_time = 2
	for i in $"../../Player".get_children():
		i.set_deferred("global_position",$PlayerSpawn.global_position)

func _on_portal_body_entered(body: Node2D) -> void:
	if body.name == "PlayerBasic":
		change_worlds(self, "res://scenes/world_0.tscn")
	return
