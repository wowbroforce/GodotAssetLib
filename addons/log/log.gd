extends Node

var _loggers: Array[Logger]

func _ready() -> void:
	add_logger(ConsoleLogger.make())

func add_logger(logger: Logger):
	_loggers.append(logger)

func debug(message: String, tag: String = "", meta: Dictionary = {}):
	for logger in _loggers:
		logger.debug.call(message, tag, meta)

func error(_error: String, message: String, tag: String = "", meta: Dictionary = {}):
	for logger in _loggers:
		logger.error.call(_error, message, tag, meta)

func info(message: String, tag: String = "", meta: Dictionary = {}):
	for logger in _loggers:
		logger.info.call(message, tag, meta)
	
func warning(message: String, tag: String = "", meta: Dictionary = {}):
	for logger in _loggers:
		logger.warning.call(message, tag, meta)

# - Utility methods

# This function gets metadata from the output of Signal.get_connections()
func get_meta_from_connections(connections: Array) -> Dictionary:
	var meta = {}
	for connection in connections:
		var sub_meta = {}
		meta[connection["callable"].get_object().get_instance_id()] = {
			"signal_name": connection["signal"].get_name(),
			"callable_object_name": connection["callable"].get_object().name
		}
	return meta
