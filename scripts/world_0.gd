extends "res://scripts/world.gd"

func _ready() -> void:
	clear_enemies()



func _on_portal_1_entered(_body: Node2D) -> void:
	change_worlds(self, "res://scenes/world_1.tscn")
	pass # Replace with function body.
