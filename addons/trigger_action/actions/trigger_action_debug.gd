extends TriggerAction

@export var message: String

func invoke_action(metadata: Dictionary) -> void:
	print_debug("%s: %s" % [get_script().resource_path, message])
