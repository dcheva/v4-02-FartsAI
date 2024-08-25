extends BTAction

@export var groups: Array[StringName] = ["NPC", "Player"]
@export var target_var: StringName = &"target"

var target

func _tick(_delta: float) -> Status:
	var group = groups.pick_random()
	if group == "Player":
		target = get_player_node()
	elif group == "NPC":
		target = get_npc_node()
	print("%s :]->[: %s" % [agent.name, target.name])
	blackboard.set_var(target_var, target)
	
	return SUCCESS

func get_player_node():
	var nodes = get_nodes("Player")
	return nodes.front()

func get_npc_node() -> Node:
	var nodes = get_nodes("NPC")
	var npcs: Array[Node]
	if nodes.size() > 1:
		for node in nodes:
			if !agent.check_for_self(node):
				npcs.append(node)
		npcs.shuffle()
	if npcs.size() > 1:
		return npcs.front()
	else:
		return null

func get_nodes(group: StringName) -> Array[Node]:
	var nodes = agent.get_tree().get_nodes_in_group(group)
	print("In group: %s" % group)
	return nodes
	
