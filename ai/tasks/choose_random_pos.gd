extends BTAction

@export var range_min_in_dir: float = 40
@export var range_max_in_dir: float = 100

@export var position_var: StringName = &"pos"
@export var direction_var: StringName = &"dir"

func _tick(_delta: float) -> Status:
	var pos: Vector2
	var dir = ran_dir()
	return SUCCESS
	
func ran_dir():
	var dir = Vector2(randf()-0.5,randf()-0.5).normalized()
	print(dir)
	return dir
