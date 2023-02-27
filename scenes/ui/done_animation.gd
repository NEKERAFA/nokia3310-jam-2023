extends Control


signal animation_finished


func play():
	$AnimatedSprite.play("done")


func _on_AnimatedSprite_finished():
	emit_signal("animation_finished")
