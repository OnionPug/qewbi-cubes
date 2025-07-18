extends World

func _ready() -> void:
	clear_enemies()
	var pistons = $Pistons.get_children()
	var delay = 0.75
	for i in range(len(pistons)):
		print(i)
		pistons[i].down_time = 2
		pistons[i].up_time = 1
		pistons[i].start_time = i*delay
		pistons[i].start()
	
	for i in $"../../Player".get_children():
		i.set_deferred("global_position",$PlayerSpawn.global_position)

func _on_portal_body_entered(body: Node2D) -> void:
	if body.name == "PlayerBasic":
		change_worlds(self, "res://scenes/qewbi_apartment.tscn")
	return
