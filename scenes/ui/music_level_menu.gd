extends Control


onready var _option = ConfigManager.music_level


func _ready():
	_update_options()


func _process(_delta):
	if Input.is_action_just_pressed("key_up"):
		_option = (_option - 1) % 5
		if _option < 0:
			_option += 5
		_update_options()
	elif Input.is_action_just_pressed("key_down"):
		_option = (_option + 1) % 5
		_update_options()
	elif Input.is_action_just_pressed("key_accept"):
		_update_music_level()
	elif Input.is_action_just_pressed("key_cancel"):
		SceneComposer.pop_scene()


func _update_options():
	$MenuIndicator/CurrentOption.text = str(_option + 1)
	$OptionMenuIndicator.set_option(_option)
	$LevelOptions/LevelTopLabel.text = "Level %d" % (_option + 1)
	$LevelOptions/LevelMiddleLabel.text = "Level %d" % ((_option + 1) % 5 + 1)
	$LevelOptions/LevelBottomLabel.text = "Level %d" % ((_option + 2) % 5 + 1)


func _update_music_level():
	ConfigManager.set_music_level(_option)
	$DoneAnimation.visible = true
	$DoneAnimation.play()


func _on_DoneAnimation_finished():
	SceneComposer.pop_scene()
