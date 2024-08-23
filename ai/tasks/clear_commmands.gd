extends BTAction

func _tick(_delta: float) -> Status:
		agent.commands = []
		return SUCCESS
