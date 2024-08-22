extends CharacterBody2D


func _ready() -> void:
	$AnimationPlayer.play("idle")
	$Chatbox.hide()
	$Warnbox.show()
	$BoxPlayer.play("warning")
	$CPUParticles2D.emitting = true


func _physics_process(delta: float) -> void:
	pass
