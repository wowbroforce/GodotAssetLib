extends TriggerAction

@export var message: String

func invoke_action(_node: Node) -> void:
	print_debug("%s: %s" % [get_script().resource_path, message])
