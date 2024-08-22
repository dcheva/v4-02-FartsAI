extends CharacterBody2D


func _ready() -> void:
	$AnimationPlayer.play("idle")
	$Chatbox.hide()
	$Warnbox.show()


func _physics_process(delta: float) -> void:
	pass
