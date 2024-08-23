extends BTAction

@export var range_min_in_dir: int = 100
@export var range_max_in_dir: int = 400

@export var position_var: StringName = &"pos"
@export var direction_var: StringName = &"dir"

func _tick(_delta: float) -> Status:
	if !agent.is_in_group("NPC"): return SUCCESS
	
	var dir = ran_dir()
	var pos = ran_pos(dir)
	blackboard.set_var(direction_var, dir)
	blackboard.set_var(position_var, pos)
	
	return SUCCESS
	
func ran_pos(dir: Vector2) -> Vector2:
	var pos = Vector2(randi_range(range_min_in_dir, range_max_in_dir) * dir)
	pos = pos + agent.get_viewport_rect().size / 2
	return pos
	
func ran_dir() -> Vector2:
	var dir = Vector2(randf()-0.5,randf()-0.5).normalized()
	return dir
