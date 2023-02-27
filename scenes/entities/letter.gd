extends Area2D
class_name Letter


const LETTERS = ["abcdef", "ghijklmno", "pqrstuvwxyz"]


var _updating = true
var _velocity_x = 4
var _delta_x = 0


func get_letter():
	return $Label.text


func set_velocity_x(velocity_x: int):
	_velocity_x = velocity_x


func _ready():
	var letter_array: String = ""
	
	match int(position.y):
		70:
			letter_array = LETTERS[0]
		200:
			letter_array = LETTERS[1]
		330:
			letter_array = LETTERS[2]

	$Label.text = letter_array[randi() % letter_array.length()]


func _process(delta):
	_delta_x += _velocity_x * delta
	
	if _delta_x >= 1.0:
		position.x += 10
		_delta_x = _delta_x - 1.0
