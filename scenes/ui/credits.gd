extends Control


const TEXT = [
	"Developed by",
	"NEKERAFA",
	"",
	"Audio by",
	"ArtistSynth",
	"",
	"Made in GODOT"
]


var _line = 0


func _ready():
	_update_lines(TEXT.slice(0, 3))


func _process(_delta):
	if Input.is_action_just_pressed("key_accept") or Input.is_action_just_pressed("key_cancel"):
		SceneComposer.pop_scene()
	
	
	var update_lines = false

	if Input.is_action_just_pressed("key_down") and _line < TEXT.size() - 3:
		_line += 1
		update_lines = true
		print(_line)
	elif Input.is_action_just_pressed("key_up") and _line > 0:
		_line -= 1
		update_lines = true
	
	if update_lines:
		_update_lines(TEXT.slice(_line, _line + 3))
		$MenuIndicator/CurrentOption.text = str(_line + 1)
		$OptionMenuIndicator.set_option(_line)


func _update_lines(lines):
	$CreditLabels/CreditTopLabel.text = lines[0]
	$CreditLabels/CreditMiddleLabel.text = lines[1]
	$CreditLabels/CreditBottomLabel.text = lines[2]
