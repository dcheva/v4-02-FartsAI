extends BTAction

func _tick(_delta: float) -> Status:
		if agent.get_groups().find("Player") > -1:
			return FRESH
		else:
			print("Agent name: %s" % agent.name)
			return SUCCESS
