extends CharacterBody2D


var max_speed = 400
var max_speed_walk = max_speed * 1
var max_speed_run = max_speed * 2
var speed_to: Vector2
@export var commands: Array


func _ready() -> void:
	$AnimationPlayer.play("idle")
	$Chatbox.hide()
	$Warnbox.hide()


func _physics_process(delta: float) -> void:
	get_action(delta)
	move_and_slide()


func get_action(delta: float) -> void:
	speed_to = Vector2.ZERO
	if get_command("shift"):
		max_speed = lerpf(max_speed, max_speed_run, delta * 4)
	else: 
		max_speed = lerpf(max_speed, max_speed_walk, delta * 4)
	if get_command("up_arrow"):
		speed_to += Vector2.UP
	if get_command("down_arrow"):
		speed_to += Vector2.DOWN
	if get_command("left_arrow"):
		speed_to += Vector2.LEFT
	if get_command("right_arrow"):
		speed_to += Vector2.RIGHT
	if get_command("space"):
		fart(delta)
	velocity = lerp(velocity, speed_to.normalized() * max_speed, delta * 4)


func get_command(command) -> bool:
	if self.is_in_group("NPC"):
		return commands.find(command) > -1
	else:
		return Input.is_action_pressed(command)


func fart(delta) -> void:
	$CPUParticles2D.lifetime = delta * 20
	$CPUParticles2D.one_shot = true
	$CPUParticles2D.emitting = true
	$FartPlayer2D.play()
	$BoxPlayer.play("warning")
