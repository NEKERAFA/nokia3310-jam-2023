extends Control


var _option = 0


func _process(delta):
	if Input.is_action_just_pressed("key_accept"):
		_option += 1
		
		if _option == 1:
			$ControlsKeys.visible = false
			$ControlsNumpad.visible = true
		elif _option == 2:
			SceneComposer.change_scene("res://scenes/ui/MainMenu.tscn")
