@tool
class_name TextureEditorTools
extends Control

@onready var window: Window = $Window
@onready var texture_region_editor_control: TextureRegionEditorControl = $Window/TextureRegionEditorControl

const region_metadata_key: String = "EditorInspectorPlugin.Region"

var texture: Texture2D
var material_to_update: BaseMaterial3D
var object_to_update: Object:
	set(new_value):
		object_to_update = new_value
		if object_to_update == null: return
		print(" - > object_to_update id = %s, name = %s" % [object_to_update.get_instance_id(), "N/A"])

func _ready() -> void:
	print("TextureEditorTools: _ready")
	texture_region_editor_control.region_selected.connect(_on_region_selected)

func _on_show_window_button_pressed() -> void:
	print("_on_show_window_button_pressed")
	texture_region_editor_control.texture = texture
	if object_to_update != null && object_to_update.has_meta(region_metadata_key):
		var region := object_to_update.get_meta(region_metadata_key) as Rect2i
		texture_region_editor_control.set_region(region)
	window.size = EditorInterface.get_base_control().size / 2
	window.popup_centered()

func _on_window_close_requested() -> void:
	window.hide()

func _on_region_selected(region: Rect2i) -> void:
	print(" - > selected region = %s" % region)
	if material_to_update != null:
		print(" - > material_to_update = %s" % material_to_update)
		var texture_size := texture.get_size()
		var uv_offset := Vector2(region.position) / texture_size
		var uv_scale := Vector2(region.size) / texture_size
		material_to_update.uv1_offset = Vector3(uv_offset.x, uv_offset.y, 0)
		material_to_update.uv1_scale = Vector3(uv_scale.x, uv_scale.y, 0)
	if object_to_update != null:
		object_to_update.set_meta(region_metadata_key, region)
	window.hide()
