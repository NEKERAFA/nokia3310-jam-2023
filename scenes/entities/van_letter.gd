extends Label


const KEY_LETTERS = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]


var _current_key = -1
var _current_letter = -1


func _process(_delta):
	var key_pressed = _get_key_pressed()
	
	if key_pressed != -1:
		_update_key(key_pressed)


func _get_key_pressed():
	var key_pressed = -1

	if Input.is_action_just_pressed("key_2"):
		key_pressed = 0
	elif Input.is_action_just_pressed("key_3"):
		key_pressed = 1
	elif Input.is_action_just_pressed("key_4"):
		key_pressed = 2
	elif Input.is_action_just_pressed("key_5"):
		key_pressed = 3
	elif Input.is_action_just_pressed("key_6"):
		key_pressed = 4
	elif Input.is_action_just_pressed("key_7"):
		key_pressed = 5
	elif Input.is_action_just_pressed("key_8"):
		key_pressed = 6
	elif Input.is_action_just_pressed("key_9"):
		key_pressed = 7

	return key_pressed


func _update_key(key_pressed):
	if _current_key == key_pressed:
		_current_letter += 1
		_current_letter %= KEY_LETTERS[key_pressed].length()
	else:
		_current_key = key_pressed
		_current_letter = 0
	
	text = KEY_LETTERS[_current_key][_current_letter]
