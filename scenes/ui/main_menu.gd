extends Control


export(Color) var font_color_normal
export(Color) var font_color_selected

export(StyleBox) var styles_normal
export(StyleBox) var styles_selected


var _option: int = 0


func _ready():
	$IntoAudioPlayer.play()


func _process(_delta):
	if Input.is_action_just_pressed("key_up") and _option == 1:
		_set_play_option()
	elif Input.is_action_just_pressed("key_down") and _option == 0:
		_set_options_option()
	elif Input.is_action_just_pressed("key_accept"):
		match _option:
			0:
				SceneComposer.push_scene("res://scenes/Game.tscn")
			1:
				SceneComposer.push_scene("res://scenes/ui/OptionsMenu.tscn")
	elif Input.is_action_just_pressed("key_cancel"):
		SceneComposer.pop_scene()


func _set_play_option():
	_option = 0
	$PlayLabel.add_color_override("font_color", font_color_selected)
	$PlayLabel.add_stylebox_override("normal", styles_selected)
	$OptionsLabel.add_color_override("font_color", font_color_normal)
	$OptionsLabel.add_stylebox_override("normal", styles_normal)


func _set_options_option():
	_option = 1
	$PlayLabel.add_color_override("font_color", font_color_normal)
	$PlayLabel.add_stylebox_override("normal", styles_normal)
	$OptionsLabel.add_color_override("font_color", font_color_selected)
	$OptionsLabel.add_stylebox_override("normal", styles_selected)
