extends BTAction

func _tick(_delta: float) -> Status:
		var name = agent.name
		if name == "Player":
			return FRESH
		else:
			print("Agent name: %s" % name)
			return SUCCESS
