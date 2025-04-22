class_name TriggerActionChangeLevel

extends TriggerAction

@export var next_level: PackedScene

func _ready():
	assert(next_level != null, "[TriggerActionChangeLevel] next_level should be set.")

func invoke_action(_node: Node2D) -> void:
	print(_node)
	if _node is not Player: return
	LevelState.change_level(next_level)
