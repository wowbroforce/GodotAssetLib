class_name UUID

# UUID size in bytes (16 bytes for a UUID)
const UUID_SIZE = 16

# Internal storage for the UUID bytes
var _uuid: PackedByteArray

var uuid_string: String:
	get:
		var hex_chars = "0123456789abcdef"
		var result = ""
		for i in range(UUID_SIZE):
			if i == 4 or i == 6 or i == 8 or i == 10:
				result += "-"
			result += hex_chars[(_uuid[i] >> 4) & 0xF]
			result += hex_chars[_uuid[i] & 0xF]
		return result

# Initialize a random UUID
func _init():
	_uuid = PackedByteArray()
	_uuid.resize(UUID_SIZE)
	for i in range(UUID_SIZE):
		_uuid[i] = randi() % 256
	# Set version (4) and variant bits (8, 9, A, or B)
	_uuid[6] = (_uuid[6] & 0x0F) | 0x40  # Version 4
	_uuid[8] = (_uuid[8] & 0x3F) | 0x80  # Variant bits

# Compare this UUID with another UUID
func is_equal(other: UUID) -> bool:
	for i in range(UUID_SIZE):
		if _uuid[i] != other._uuid[i]:
			return false
	return 0
