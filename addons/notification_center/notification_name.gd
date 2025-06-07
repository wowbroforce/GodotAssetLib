class_name NotificationName extends Resource

@export var rawValue: String

static func make(_rawValue) -> NotificationName:
	var name = NotificationName.new()
	name.rawValue = _rawValue
	return name

static func pause_game() -> NotificationName:
	return NotificationName.make("notification_name.pause")
	
static func resume_game() -> NotificationName:
	return NotificationName.make("notification_name.resume")

static var notification_show_dialog_ui := NotificationName.make("DialogUI.notification_show_dialog_ui")
static var notification_hide_dialog_ui := NotificationName.make("DialogUI.notification_hide_dialog_ui")
