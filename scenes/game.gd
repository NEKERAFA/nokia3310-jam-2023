extends Node


export(PackedScene) var letter_scene


var _points = 0
var _current_velocity = 4
var _is_gameover = false


func _ready():
	randomize()
	_start_game()


func _process(delta):
	if _is_gameover:
		if Input.is_action_just_pressed("key_cancel"):
			SceneComposer.pop_scene()
		elif Input.is_action_just_pressed("key_accept"):
			SceneComposer.change_scene("res://scenes/Game.tscn")


func _start_game():
	$SpawnTimer.connect("timeout", self, "_on_SpawnTimer_timeout")
	$SpawnTimer.start()
	_spawn_letter()


func _spawn_letter():
	var letter: Letter = letter_scene.instance()
	letter.set_velocity_x(_current_velocity)
	
	match randi() % 3:
		0:
			letter.position = Vector2(-60, 70)
		1:
			letter.position = Vector2(-60, 200)
		2:
			letter.position = Vector2(-60, 330)
	
	add_child(letter)


func _gameover():
	_is_gameover = true
	$Player.stop()
	$SpawnTimer.stop()
	$SpawnTimer.disconnect("timeout", self, "_on_SpawnTimer_timeout")
	$GameOver.visible = true
	get_tree().call_group("letters", "queue_free")


func _update_current_velocity():
	get_tree().call_group("letters", "set_velocity_x", _current_velocity)


func _on_SpawnTimer_timeout():
	_spawn_letter()


func _on_Gameover_area_entered(_area):
	_gameover()


func _on_Player_incorrect_letter_entered():
	_gameover()


func _on_Player_correct_letter_entered():
	_points += 1
	
	if _points == 10:
		$SpawnTimer.wait_time = 6
		_current_velocity = 8
		_update_current_velocity()
	elif _points == 30:
		$SpawnTimer.wait_time = 4
	elif _points == 50:
		$SpawnTimer.wait_time = 1
		_current_velocity = 16
		_update_current_velocity()
	
	$PointsLabel.text = str(_points)
