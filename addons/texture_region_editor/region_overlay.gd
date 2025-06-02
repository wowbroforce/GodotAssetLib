@tool
class_name RegionOverlay
extends Control

var texture: Texture2D
var grid_size := Vector2i(16, 16):
	get: return grid_size
	set(new_value):
		print(" - > RegionOverlay grid_size new_value = %s" % new_value)
		grid_size = new_value
		
var region := Rect2i(0, 0, 0, 0)

var dragging := false
var drag_start := Vector2i()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index != MOUSE_BUTTON_LEFT: return
		if !event.pressed:
			dragging = false
			return
		drag_start = snap_to_grid(get_local_mouse_position())
		if !get_global_rect().has_point(drag_start): return
		dragging = true
		region.position = drag_start
		region.size = Vector2i.ZERO
		queue_redraw()
	elif event is InputEventMouseMotion and dragging:
		var drag_end = snap_to_grid(get_local_mouse_position())
		region.position = drag_start
		region.size = (drag_end - drag_start).abs() + grid_size
		region.position = drag_start.min(drag_end)
		queue_redraw()

func snap_to_grid(pos: Vector2) -> Vector2i:
	return Vector2i(
	floor(pos.x / grid_size.x) * grid_size.x,
		floor(pos.y / grid_size.y) * grid_size.y
	)

func set_region(new_region: Rect2i) -> void: 
	region = new_region

func _draw():
	if texture:
		draw_texture(texture, Vector2.ZERO)

	# Draw grid
	var size = get_size()
	for x in range(0, size.x, grid_size.x):
		draw_line(Vector2(x, 0), Vector2(x, size.y), Color(1, 1, 1, 0.1))
	for y in range(0, size.y, grid_size.y):
		draw_line(Vector2(0, y), Vector2(size.x, y), Color(1, 1, 1, 0.1))

	# Draw selection rectangle
	if region.size != Vector2i.ZERO:
		draw_rect(Rect2(region.position, region.size), Color(1, 1, 0, 0.3), true)
		draw_rect(Rect2(region.position, region.size), Color(1, 1, 0), false)
