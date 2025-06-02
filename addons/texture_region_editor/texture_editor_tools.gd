@tool
class_name TextureEditorTools
extends Control

@onready var window: Window = $Window
@onready var texture_region_editor_control: TextureRegionEditorControl = $Window/TextureRegionEditorControl

var texture: Texture2D
var material_to_update: BaseMaterial3D

func _ready() -> void:
	print("TextureEditorTools: _ready")
	texture_region_editor_control.region_selected.connect(_on_region_selected)

func _on_show_window_button_pressed() -> void:
	print("_on_show_window_button_pressed")
	texture_region_editor_control.texture = texture
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
	window.hide()
