class_name TriggerActionDespawn

extends TriggerAction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func invoke_action(node: Node2D) -> void:
	node.get_parent().remove_child(node)
	node.queue_free()
