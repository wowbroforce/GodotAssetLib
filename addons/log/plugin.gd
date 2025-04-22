@tool
extends EditorPlugin

func _enable_plugin():
	add_autoload_singleton("Log", "res://addons/log/log.gd")


func _disable_plugin():
	remove_autoload_singleton("Log")
