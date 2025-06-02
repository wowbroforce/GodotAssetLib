#deprecated

@tool
extends Control
class_name EditorInspectorSection

var title: String
var content: Control

func _init(section_title: String, section_content: Control):
	pass
	#title = section_title
	#content = section_content

func _enter_tree():
	pass
	#var margin = MarginContainer.new()
	#margin.add_theme_constant_override("margin_left", 16)
	#
	#var vbox = VBoxContainer.new()
	#margin.add_child(vbox)
	#
	#var label = Label.new()
	#label.text = title
	#vbox.add_child(label)
	#
	#vbox.add_child(content)
	#add_child(margin)
