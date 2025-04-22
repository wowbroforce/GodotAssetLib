# This is a basic script for the Trigger-Action system.
# This script provides a base for the Trigger system.
# This script provides all the action nodes that are children of this trigger node.

class_name CollisionTriggerBase2D

extends TriggerBase

# - Public Properties

@export var area_2d: Area2D

var _overlapping_areas: Array[Area2D]

# - Private Functions

func _ready() -> void:
	if area_2d: return
	push_error("%s: 'area_2d' must be set." % get_script().resource_path)

func _physics_process(_delta: float) -> void:
	var areas = area_2d.get_overlapping_areas()
	var new_nodes = _subtract(_overlapping_areas, areas)
	for node in new_nodes:
		_invoke_actions(node)
	_overlapping_areas = areas

func _area_to_node(area: Area2D) -> Node2D:
	return area as Node2D

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
