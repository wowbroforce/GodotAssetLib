extends TriggerAction

@export var duration: float = 0

func invoke_action(metadata: Dictionary) -> void:
	if duration <= 0: return
	await get_tree().create_timer(duration).timeout
