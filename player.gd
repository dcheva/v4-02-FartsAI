extends CharacterBody2D


var max_speed = 100
var max_speed_walk = max_speed * 0.8
var max_speed_run = max_speed * 1.2
var speed_to: Vector2


func _ready() -> void:
	$AnimationPlayer.play("idle")
	$Chatbox.hide()
	$Warnbox.hide()


func _physics_process(delta: float) -> void:
	get_input(delta)
	move_and_slide()


func get_input(delta: float) -> void:
	speed_to = Vector2.ZERO
	if Input.is_action_pressed("shift"):
		max_speed = lerpf(max_speed, max_speed_run, delta * 4)
	else: 
		max_speed = lerpf(max_speed, max_speed_walk, delta * 4)
	if Input.is_action_pressed("up_arrow"):
		speed_to += Vector2.UP * max_speed
	if Input.is_action_pressed("down_arrow"):
		speed_to += Vector2.DOWN * max_speed
	if Input.is_action_pressed("left_arrow"):
		speed_to += Vector2.LEFT * max_speed
	if Input.is_action_pressed("right_arrow"):
		speed_to += Vector2.RIGHT * max_speed
	if Input.is_action_pressed("space"):
		fart()
	velocity = lerp(velocity, speed_to, delta * 4)


func fart() -> void:
	$CPUParticles2D.one_shot = true
	$CPUParticles2D.emitting = true
