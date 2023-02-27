extends Node


var _config: ConfigFile = ConfigFile.new()

var music_level: int = 2 setget set_music_level


func _init():
	var file = File.new()
	if file.file_exists('user://config.cfg'):
		if _config.load('user://config.cfg') == OK:
			music_level = _config.get_value('music', 'level', 2)
	_update_music_level(music_level)


func set_music_level(level: int):
	music_level = level
	_update_music_level(music_level)
	_config.set_value('music', 'level', music_level)
	_config.save('user://config.cfg')


func _update_music_level(level: int):
	match level:
		4:
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
		3:
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -3)
		2:
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -6)
		1:
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -12)
		0:
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -36)
