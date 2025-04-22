class_name ConsoleLogger

static func make() -> Logger:
	return Logger.new(
		func(message: String, tag: String = "", meta: Dictionary = {}):
			print("%s [%s] %s\nMetadata:\n%s" % ["🛠", tag, message, _meta_to_string(meta)]),
		func(error: String, message: String, tag: String = "", meta: Dictionary = {}):
			print("%s [%s] %s\nError: %$s\nMetadata:\n%s" % ["🔥🔥🔥", tag, message, error, _meta_to_string(meta)]),
		func(message: String, tag: String = "", meta: Dictionary = {}):
			print("%s [%s] %s\nMetadata:\n%s" % ["ℹ", tag, message, _meta_to_string(meta)]),
		func(message: String, tag: String = "", meta: Dictionary = {}):
			print("%s [%s] %s\nMetadata:\n%s" % ["⚠", tag, message, _meta_to_string(meta)])
	)

static func _meta_to_string(meta: Dictionary) -> String:
	if meta.is_empty():
		return ""
	var key_value_pairs = []
	for key in meta:
		key_value_pairs.append("%s: %s" % [key, meta[key]])
	var string := ""
	for value in key_value_pairs:
		string += "%s\n" % value
	return string.substr(0, string.length() - 1)
