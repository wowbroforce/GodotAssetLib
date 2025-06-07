class_name TriggerActionDespawn

extends TriggerAction

func invoke_action(metadata: Dictionary) -> void:
	var node = metadata["node"]
	if node == null: return
	node.get_parent().remove_child(node)
	node.queue_free()
