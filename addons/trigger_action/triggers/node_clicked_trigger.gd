class_name NodeClickedTrigger

extends TriggerBase

@export var collision_object: CollisionObject3D

func _ready() -> void:
	if collision_object == null:
		collision_object = _get_collision_object()
	
	if collision_object == null:
		push_error("%s: Didn't find any 'CollisionObject3D' node." % get_script().resource_path)
	
	collision_object.input_event.connect(_on_collision_object_input_event)

func _on_collision_object_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is not InputEventMouseButton: return
	if event.button_index != MOUSE_BUTTON_LEFT: return
	if !event.is_pressed(): return
	
	children_actions

func _get_collision_object() -> CollisionObject3D:
	var parent := get_parent()
	if parent is CollisionObject3D: return parent
	
	var child = parent.find_children("*", "CollisionObject3D", true, true).front() as CollisionObject3D
	if child: return child
	
	return null
