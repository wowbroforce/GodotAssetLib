class_name NotificationName extends Resource

@export var rawValue: String

func _init(_rawValue) -> void:
	rawValue = _rawValue

static func pause_game() -> NotificationName:
	return NotificationName.new("notification_name.pause")
	
static func resume_game() -> NotificationName:
	return NotificationName.new("notification_name.resume")

static var notification_show_dialog_ui := NotificationName.new("DialogUI.notification_show_dialog_ui")
static var notification_hide_dialog_ui := NotificationName.new("DialogUI.notification_hide_dialog_ui")
