class_name BodyFilter

extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func applies_to(body: Node2D) -> bool:
	return body.get_meta("is_enemy", false)
