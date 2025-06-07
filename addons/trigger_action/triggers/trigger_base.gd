@icon("res://addons/trigger_action/triggers/collision_trigger.png")

class_name TriggerBase

extends Node

# - Public Properties

# Returns the Array of TriggerAction nodes
var children_actions: Array: # Array[TriggerAction]:
	get: return _get_trigger_actions()

# - Public Functions

func invoke_actions(metadata: Dictionary) -> void:
	for action in _get_trigger_actions():
		action.invoke_action(metadata)

# - Private Functions

func _trigger_action_filter(node: Node) -> bool:
	return is_instance_of(node, TriggerAction)

func _map_node_to_trigger_action(node: Node) -> TriggerAction:
	return node as TriggerAction

func _get_trigger_actions() -> Array: # Array[TriggerAction]:
	return get_children().filter(_trigger_action_filter).map(_map_node_to_trigger_action)
