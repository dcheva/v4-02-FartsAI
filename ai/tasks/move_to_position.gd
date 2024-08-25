extends BTAction

@export var position_var: StringName = &"pos"
@export var target_var: StringName = &"target"
@export var tolerance = 50

func _tick(_delta: float) -> Status:
	if !agent.is_in_group("NPC"): return SUCCESS
	
	var target_pos: Vector2
	var agent_commands: Array
	var target: CharacterBody2D 
	if blackboard.has_var(target_var):
		target = blackboard.get_var(target_var)
	if target != null:
		target_pos = target.global_position
	else:
		target_pos = blackboard.get_var(position_var, Vector2.ZERO)
	var agent_pos: Vector2 = agent.global_position
	var vector = agent_pos - target_pos
	
	if  vector.length() > tolerance:
		if agent_pos.x > target_pos.x + tolerance:
			agent_commands.append("left_arrow")
		elif agent_pos.x < target_pos.x - tolerance:
			agent_commands.append("right_arrow")
		if agent_pos.y > target_pos.y + tolerance:
			agent_commands.append("up_arrow")
		elif agent_pos.y < target_pos.y - tolerance:
			agent_commands.append("down_arrow")
		agent.commands = agent_commands
		return RUNNING
	
	else:
		blackboard.set_var(target_var, null)
		return SUCCESS
