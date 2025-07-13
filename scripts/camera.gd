extends Camera2D

func _process(_delta: float) -> void:
	#Zoom in and out - move to Player node
	if Input.is_action_just_pressed("ui_plus"): zoom += Vector2(0.25,0.25)
	if Input.is_action_just_pressed("ui_minus"): zoom -= Vector2(0.25,0.25)
