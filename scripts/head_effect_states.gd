extends Node
@onready var normal = $Normal
@onready var flatten = $Flatten

@onready var state:
	#if the state changes, initialize the change now
	set(statevalue):
		if statevalue != null:
			state = statevalue
			state.initialize()

var states_dict
func _ready() -> void:
	state = normal
	states_dict = {
		"normal": normal,
		"flatten": flatten,
	}
	
	#cooldown for head collection
	$"../Hitbox/CollisionShape2D".set_deferred("disabled", true)
	await get_tree().create_timer(1).timeout
	$"../Hitbox/CollisionShape2D".set_deferred("disabled", false)

func _process(delta: float) -> void:
	var E_states = $"../../PlayerBasic/EffectStates"
	if state == states_dict["normal"]:
		state.active(delta)
	if E_states.state == E_states.states_dict["normal"]:
		owner.head_collected.emit()
		owner.queue_free()
	
