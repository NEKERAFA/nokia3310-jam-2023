extends Node


export(PackedScene) var letter_scene


var _is_gameover = false


func _ready():
	randomize()
	_start_game()


func _start_game():
	$SpawnTimer.connect("timeout", self, "_on_SpawnTimer_timeout")
	$SpawnTimer.start()
	_spawn_letter()


func _spawn_letter():
	var letter: Area2D = letter_scene.instance()
	
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


func _on_SpawnTimer_timeout():
	_spawn_letter()


func _on_Gameover_area_entered(_area):
	_gameover()


func _on_Player_incorrect_letter_entered():
	_gameover()
