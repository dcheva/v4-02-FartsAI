extends BTAction

@export var group: StringName
@export var target_var: StringName = &"target"

var target

func _tick(_delta: float) -> Status:
	if group == "Player":
		target = get_player_node()
	elif group == "NPC":
		target = get_npc_node()
		print("Found!!!: %n" % var_to_str(target))
	blackboard.set_var(target_var, target)
	
	return SUCCESS

func get_player_node():
	var nodes = get_nodes()
	return nodes[0]

func get_npc_node():
	var nodes = get_nodes()
	var npcs: Array[Node]
	if nodes.size() > 1:
		while !agent.check_for_self(nodes.front()):
			npcs.append(nodes.front())
		npcs.shuffle()
	return npcs.front()

func get_nodes() -> Array[Node]:
	var nodes: Array[Node] = agent.get_tree().get_nodes_in_group(group)
	return nodes
	
