extends World

func _ready() -> void:
	var pistons = $Pistons.get_children()
	var delay = 0.75
	for i in range(len(pistons)):
		print(i)
		pistons[i].down_time = 2
		pistons[i].up_time = 1
		pistons[i].start_time = i*delay
		if i == 5:
			pistons[i].start_time -= 0.3
		pistons[i].start()
	move_player($PlayerSpawn.global_position)


func _on_portal_body_entered(body: Node2D) -> void:
	if body.name == "PlayerBasic":
		change_worlds(self, "res://scenes/world_1_2.tscn")
	return

func exit():
	return
