extends Area2D

@onready var fade = $"/root/Game/UI/PickupFade"


func _on_body_entered(body: Node2D) -> void:
	fade.set_deferred("visible", true)
	$Diary.set_deferred("visible", true)
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	fade.set_deferred("visible", false)
	$Diary.set_deferred("visible", false)
	pass # Replace with function body.
