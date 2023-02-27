extends Control


func set_initial_option():
	set_option(0)


func set_final_option():
	set_option(4)


func set_option(option: int):
	if option >= 0 and option <= 4:
		var atlas: AtlasTexture = $OptionMenu.texture
		if atlas:
			atlas.region.position.x = option * 3
