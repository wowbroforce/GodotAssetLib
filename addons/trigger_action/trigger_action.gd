#@icon("res://scripts/level/triggers/trigger_action.svg")

extends Node2D # AlwaysActiveNode2D

class_name TriggerAction

# Public functions

# All subclasses should override this function
func invoke_action(_node: Node2D) -> void:
	pass
