class_name TriggerActionDespawn

extends TriggerAction

func invoke_action(node: Node) -> void:
	node.get_parent().remove_child(node)
	node.queue_free()
