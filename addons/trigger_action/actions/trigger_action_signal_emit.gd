class_name TriggerActionSignalEmit

extends TriggerAction

signal trigger_action_signal(Node)

func invoke_action(with_node: Node) -> void:
	trigger_action_signal.emit(with_node)
