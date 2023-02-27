extends Node


var scenes: Array = []
var new_scene: Node = null


func _ready():
	var root = get_tree().root
	scenes.append(root.get_child(root.get_child_count() - 1))


func _process(_delta):
	if Input.is_action_just_pressed("close_game"):
		get_tree().quit()


func _remove_current_scene(free_last: bool, pop_new: bool):
	if free_last:
		var old_scene: Node = scenes.pop_back()
		if old_scene:
			old_scene.queue_free()
	else:
		var old_scene: Node = scenes.back()
		if old_scene:
			get_tree().root.remove_child(old_scene)
	
	if pop_new:
		scenes.push_back(new_scene)

	get_tree().root.add_child(new_scene)


func change_scene(path: String):
	var packed_scene: PackedScene = ResourceLoader.load(path)
	if packed_scene:
		new_scene = packed_scene.instance()
		if new_scene:
			call_deferred("_remove_current_scene", true, true)


func push_scene(path):
	var packed_scene: PackedScene = ResourceLoader.load(path)
	if packed_scene:
		new_scene = packed_scene.instance()
		if new_scene:
			call_deferred("_remove_current_scene", false, true)


func pop_scene():
	if scenes.size() > 1:
		new_scene = scenes[scenes.size() - 2]
		call_deferred("_remove_current_scene", true, false)
	else:
		get_tree().quit()
