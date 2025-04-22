extends Node

var listeners = {}
var global_key := 0
var tag := "NotificationCenter"

func subscribe(forName: NotificationName, node: Node, listener: Callable) -> Callable:
	var key = global_key
	listeners[key] = {
		"name": forName,
		"node": node,
		"listener": listener
	}
	
	global_key += 1
	
	return func():
		listeners.erase(key)

func post(notification_name: NotificationName, node: Node, parameters: Dictionary) -> void:
	for key in listeners:
		var entry = listeners[key]
		if entry.name.rawValue != notification_name.rawValue:
			continue
		if node != null && entry.node != null && node != entry.node:
			continue
		var listener = entry.listener as Callable
		var argument_count = listener.get_argument_count()
		match argument_count:
			0:
				listener.call()
			1:
				listener.call(parameters)
			3:
				listener.call(notification_name, node, parameters)
			_:
				continue
				# assert("Invalid arguments count. %s" % { "notification_name": notification_name, "argument_count": argument_count })
