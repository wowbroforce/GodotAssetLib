# This is a basic script for the Trigger-Action system.
# This script provides a base for the Trigger system.
# This script provides all the action nodes that are children of this trigger node.

@icon("res://addons/trigger_action/triggers/collision_trigger.png")

extends Area2D

class_name CollisionTriggerBase2D

# - Public Properties

# Returns the Array of TriggerAction nodes
var children_actions: Array: # Array[TriggerAction]:
	get:
		return _get_trigger_actions()

var _overlapping_areas: Array[Area2D]

# - Private Functions

func _physics_process(_delta: float) -> void:
	var areas = get_overlapping_areas()
	var new_nodes = _subtract(_overlapping_areas, areas)
	for node in new_nodes:
		_invoke_actions(node)
	_overlapping_areas = areas

func _area_to_node(area: Area2D) -> Node2D:
	return area as Node2D

func _trigger_action_filter(node: Node) -> bool:
	return is_instance_of(node, TriggerAction)
	#return node is TriggerAction

func _map_node_to_trigger_action(node: Node) -> TriggerAction:
	return node as TriggerAction

func _get_trigger_actions() -> Array: # Array[TriggerAction]:
	return get_children().filter(_trigger_action_filter).map(_map_node_to_trigger_action)

# Signals Handlers

func _on_body_entered(_body: Node2D) -> void:
	_invoke_actions(_body)

func _on_body_exited(_body: Node2D) -> void:
	pass # Replace with function body.

func _on_area_entered(area: Area2D) -> void:
	_invoke_actions(area)

func _subtract(array: Array, from: Array) -> Array:
	var result = from.duplicate()
	for item in array:
		result.erase(item)
	return result

func _invoke_actions(node: Node2D) -> void:
	for action in _get_trigger_actions():
		action.invoke_action(node)
