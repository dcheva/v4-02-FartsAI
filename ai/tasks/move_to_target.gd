extends BTAction

@export var target_var := &"target"
@export var position_var: StringName = &"pos"
@export var tolerance: int = 20

func _tick(_delta: float) -> Status:
	var target: CharacterBody2D = blackboard.get_var(target_var)
	if target != null:
		var pos = target.global_position
		blackboard.set_var(position_var, pos)
		print("Targ to %s: %s" % [target.name, Vector2i(pos)])
		return SUCCESS
		
	return FAILURE
