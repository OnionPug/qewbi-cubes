extends ProgressBar

@onready var player = $"/root/Game/Player/PlayerBasic"

func _process(_delta: float) -> void:
	value = player.health
