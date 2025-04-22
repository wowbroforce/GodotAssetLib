extends Node2D # AlwaysActiveNode2D

func invoke_action(node: Node2D) -> void:
	get_tree().paused = true
