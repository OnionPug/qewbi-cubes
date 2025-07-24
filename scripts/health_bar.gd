extends ProgressBar

@onready var player = $"/root/Game/Player/PlayerBasic"

func _ready() -> void:
	max_value = player.health

func _process(_delta: float) -> void:
	value = player.health
