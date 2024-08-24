extends BTAction

func _tick(_delta: float) -> Status:
		var agent_groups = agent.get_groups()
		var agent_name = agent.name
		if agent_groups.find("Player") > -1:
			return FRESH
		else:
			print("Agent name: %s" % agent_name)
			return SUCCESS
