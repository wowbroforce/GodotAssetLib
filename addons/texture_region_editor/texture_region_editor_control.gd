@tool
class_name TextureRegionEditorControl
extends Control

signal region_selected(region: Rect2i)

@onready var texture_rect: TextureRect = $ScrollContainer/Control/TextureRect
@onready var region_overlay: RegionOverlay = $ScrollContainer/Control/RegionOverlay
@onready var control: Control = $ScrollContainer/Control
@onready var scroll_container: ScrollContainer = $ScrollContainer
@onready var step_x_spin_box: SpinBox = $VBoxContainer/PanelContainer/HBoxContainer/StepXSpinBox
@onready var step_y_spin_box: SpinBox = $VBoxContainer/PanelContainer/HBoxContainer/StepYSpinBox

var texture: Texture2D:
	get:
		return texture
	set(new_value):
		print("update texture rect")
		texture = new_value
		texture_rect.texture = texture
		if texture == null:
			return
		var texture_size = texture.get_size()
		print("texture.get_size() = %s" % texture_size)
		control.custom_minimum_size = texture_size
		control.size = texture_size
		texture_rect.custom_minimum_size = texture_size
		texture_rect.size = texture_size

@export var grid_size := Vector2i(16, 16):
	get: return grid_size
	set(new_value):
		grid_size = new_value
		_update_spin_boxes()
		_update_region_overlay()

#var region: Rect2i

func set_region(new_region: Rect2i):
	region_overlay.set_region(new_region)

func _ready():
	texture_rect.texture = texture
	_update_spin_boxes()
	_update_region_overlay()

func _update_region_overlay() -> void:
	if region_overlay == null: return
	region_overlay.texture = texture
	region_overlay.grid_size = grid_size
	#region_overlay.region = region

func _update_spin_boxes():
	print("_update_spin_boxes")
	if step_x_spin_box != null: step_x_spin_box.value = grid_size.x
	if step_y_spin_box != null: step_y_spin_box.value = grid_size.y

func _on_step_x_spin_box_value_changed(value: float) -> void:
	print("_on_step_x_spin_box_value_changed")
	grid_size = Vector2i(value, grid_size.y)

func _on_step_y_spin_box_value_changed(value: float) -> void:
	grid_size = Vector2i(grid_size.x, value)

func _on_set_region_button_pressed() -> void:
	region_selected.emit(region_overlay.region)
