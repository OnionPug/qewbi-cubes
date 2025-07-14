extends CharacterBody2D

var ai_off
var player
func _ready():
	check_aggro()
	
	

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	var a = velocity
	velocity = direction * delta + a
	move_and_collide(velocity*delta)

func check_aggro():
	for character in $"../../Player".get_children():
		if character.aggro == true:
			player = char
		
		
