extends Control


export(Color) var font_color_normal
export(Color) var font_color_selected

export(StyleBox) var styles_normal
export(StyleBox) var styles_selected


var _option: int = 0


func _process(_delta):
	if Input.is_action_just_pressed("key_up") and _option == 1:
		_set_music_option()
	elif Input.is_action_just_pressed("key_down") and _option == 0:
		_set_credits_option()
	elif Input.is_action_just_pressed("key_accept"):
		match _option:
			0:
				SceneComposer.push_scene("res://scenes/ui/MusicLevelMenu.tscn")
			1:
				SceneComposer.push_scene("res://scenes/ui/Credits.tscn")
	elif Input.is_action_just_pressed("key_cancel"):
		SceneComposer.pop_scene()


func _set_music_option():
	_option = 0
	$MusicOption.add_stylebox_override("normal", styles_selected)
	$MusicOption.add_color_override("font_color", font_color_selected)
	$CreditsOption.add_stylebox_override("normal", styles_normal)
	$CreditsOption.add_color_override("font_color", font_color_normal)
	$OptionMenuIndicator.set_initial_option()
	$CurrentOption.text = "1"


func _set_credits_option():
	_option = 1
	$MusicOption.add_stylebox_override("normal", styles_normal)
	$MusicOption.add_color_override("font_color", font_color_normal)
	$CreditsOption.add_stylebox_override("normal", styles_selected)
	$CreditsOption.add_color_override("font_color", font_color_selected)
	$OptionMenuIndicator.set_final_option()
	$CurrentOption.text = "2"
