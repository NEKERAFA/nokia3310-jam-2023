extends Area2D


signal incorrect_letter_entered


func stop():
	$AnimatedSprite.stop()


func _process(_delta):
	if $AnimatedSprite.is_playing():
		if (
				Input.is_action_just_pressed("key_2") or
				Input.is_action_just_pressed("key_3")
		):
			position.y = 60
		elif (
				Input.is_action_just_pressed("key_4") or
				Input.is_action_just_pressed("key_5") or
				Input.is_action_just_pressed("key_6")
		):
			position.y = 190
		elif (
				Input.is_action_just_pressed("key_7") or
				Input.is_action_just_pressed("key_8") or
				Input.is_action_just_pressed("key_9")
		):
			position.y = 320


func _on_Player_area_entered(area: Area2D):
	var letter = area as Letter

	if letter:
		if letter.get_letter() != $VanLetter.text:
			emit_signal("incorrect_letter_entered")

		letter.queue_free()

