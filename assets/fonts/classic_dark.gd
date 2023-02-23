tool
class_name ClassicDark
extends BitmapFont


const CHARACTERS = [
	"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	"abcdefghijklmnopqrstuvwxyz",
	"0123456789 $€£¥¤+-*/=%\"'#@",
	"&_(),.;:?!\\|{}<>[]'^~"
]


const CHAR_WIDTH = 7
const CHAR_HEIGHT = 8


func _init():
	var texture: Texture = load("res://assets/fonts/classic/classic_dark.png")
	if texture:
		add_texture(texture)
		for row in range (0, CHARACTERS.size()):
			var row_value: String = CHARACTERS[row]
			for column in range(0, row_value.length()):
				add_char(row_value.ord_at(column), 0, Rect2(column * CHAR_WIDTH, row * CHAR_HEIGHT, CHAR_WIDTH, CHAR_HEIGHT), Vector2(0, 0))
