class_name TriggerActionSignalEmit

extends TriggerAction

signal trigger_action_signal(Node)

func invoke_action(metadata: Dictionary) -> void:
	var node = metadata["node"]
	if node == null: return
	trigger_action_signal.emit(node)
