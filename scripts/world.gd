extends Node2D

class_name World

const ENEMY_DICT = {
	"flatten": "res://scenes/enemy_flatten.tscn",
}

func change_worlds(old_world, new_world_path):
	old_world.exit()
	old_world.queue_free()
	var new_world = load(new_world_path).instantiate()
	get_node("/root/Game/World").add_child(new_world)
	return

func clear_enemies():
	for node in get_node("/root/Game/Enemies").get_children():
		node.queue_free()
	return

func spawn_enemy(enemy, enemy_position):
	var new_enemy = load(ENEMY_DICT[enemy]).instantiate()
	new_enemy.set_deferred("global_position", enemy_position)
	get_node("/root/Game/Enemies").add_child(new_enemy)
	return 

func spawn_enemy_random(enemy_position):
	var new_enemy = load(ENEMY_DICT.values().pick_random()).instantiate()
	new_enemy.set_deferred("global_position", enemy_position)
	get_node("/root/Game/Enemies").add_child(new_enemy)	
	return

func move_player(location):
	for i in $"../../Player".get_children():
		i.set_deferred("global_position",location)
	return

func exit():
	return
