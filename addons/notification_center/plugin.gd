@tool
extends EditorPlugin

func _enable_plugin():
	add_autoload_singleton("NotificationCenter", "res://addons/notification_center/notification_center.gd")


func _disable_plugin():
	remove_autoload_singleton("NotificationCenter")
