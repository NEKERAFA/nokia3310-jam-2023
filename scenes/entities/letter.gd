extends Area2D
class_name Letter


const LETTERS = ["abcdef", "ghijklmno", "pqrstuvwxyz"]


var updating = true
var velocity_x = 4
var delta_x = 0


func get_letter():
	return $Label.text


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
	if updating:
		delta_x += velocity_x * delta
		
		if delta_x >= 1.0:
			position.x += 10
			delta_x = delta_x - 1.0
