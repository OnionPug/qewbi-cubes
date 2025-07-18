extends Node
@onready var dead = $Dead
@onready var normal = $Normal
@onready var flatten = $Flatten
@onready var headless = $Headless

@onready var state = normal:
	#if the state changes, initialize the change now
	set(statevalue):
		if statevalue != null:
			if state != statevalue:
				prevstate = state
				state = statevalue
				if prevstate != headless:
					prevstate.exit()
				state.initialize()
			else: state.take_damage()
var prevstate


var states_dict
func _ready() -> void:
	states_dict = {
		"dead": dead,
		"normal": normal,
		"flatten": flatten,
		"headless": headless,
		
		"ui_0": dead,
		"ui_1": normal,
		"ui_2": flatten,
		"ui_3": headless,
	}

var layer_dict = {
	"dead": 16,
	"normal": 5,
	"flatten": 9,
	"headless": 10,
	"melt": 11,
	"freeze": 12,
}

var debug_inputs = ["ui_0", "ui_1", "ui_2", "ui_3"]

func _process(_delta: float) -> void:
	#state picker for debugging
	for i in debug_inputs:
		if Input.is_action_just_pressed(i):
			state = states_dict[i]
	
	if state == dead:
		state.active(owner.killer)
	else:
		state.active()
	
