@icon("res://addons/trigger_action/actions/trigger_action.svg")

class_name TriggerAction

extends Node

# Public functions
@export var isDisabled := false:
	set (new_value):
		isDisabled = new_value
		_isDisabledChanged()

# All subclasses should override this function
func invoke_action(metadata: Dictionary) -> void:
	pass

func _ready() -> void:
	_isDisabledChanged()
	
func _isDisabledChanged() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED if isDisabled else Node.AUTO_TRANSLATE_MODE_INHERIT
