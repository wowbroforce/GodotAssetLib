extends Node2D # AlwaysActiveNode2D

@export var duration: float = 0

func invoke_action(node: Node2D) -> void:
	if duration <= 0:
		return
	await get_tree().create_timer(duration).timeout
