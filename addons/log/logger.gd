class_name Logger

var debug: Callable
var error: Callable
var info: Callable
var warning: Callable

func _init(_debug: Callable, _error: Callable, _info: Callable, _warning: Callable) -> void:
	debug = _debug
	error = _error
	info = _info
	warning = _warning
