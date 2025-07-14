extends World

func _ready() -> void:
	clear_enemies()
	$"../../Player/PlayerBasic".set_deferred("global_position",$PlayerSpawn.global_position)


func _on_portal_1_entered(body: Node2D) -> void:
	if body.name == "PlayerBasic":
		change_worlds(self, "res://scenes/world_1_0.tscn")
	pass # Replace with function body.
