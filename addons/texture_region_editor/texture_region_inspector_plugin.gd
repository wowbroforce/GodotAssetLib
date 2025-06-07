@tool
extends EditorInspectorPlugin

#const EditorInspectorSection = preload("res://addons/texture_region_editor/editor_inspector_section.gd")

#var editor_interface: EditorInterface
var fileDialog: FileDialog = FileDialog.new()
var tools: TextureEditorTools

func _can_handle(object):
	return object is BaseMaterial3D  # Works with all 3D materials

func _parse_begin(object: Object) -> void:
	pass

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	# Add region editor AFTER the texture property
	if name == "albedo_texture":
		#var label = Label.new()
		#label.text = "Tools Label"
		#add_property_editor(name, label)
		print("_parse_property albedo_texture")
		var material = object as BaseMaterial3D
		if material == null:
			print("material == null")
			return false
		var texture = material.albedo_texture as Texture2D
		if texture == null:
			print("texture == null")
			return false
		print("set texture")
		tools = preload("res://addons/texture_region_editor/texture_editor_tools.tscn").instantiate() as TextureEditorTools
		tools.texture = texture
		tools.material_to_update = material
		tools.object_to_update = EditorInterface.get_selection()
		add_property_editor(name, tools)
	return false

func _on_texture_removed(from_object: Node) -> void:
	EditorInterface.get_selection()
