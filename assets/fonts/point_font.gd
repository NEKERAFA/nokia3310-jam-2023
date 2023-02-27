tool
class_name PointFont
extends BitmapFont


const CHARACTERS = "0123456789"


const CHAR_WIDTH = 5
const CHAR_HEIGHT = 7


func _init():
	var texture: Texture = load("res://assets/fonts/point_font.png")
	if texture:
		add_texture(texture)
		for value in range(0, CHARACTERS.length()):
			add_char(CHARACTERS.ord_at(value), 0, Rect2(value * CHAR_WIDTH - value, 0, CHAR_WIDTH, CHAR_HEIGHT), Vector2(0, 0))
