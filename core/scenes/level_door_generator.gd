extends Node2D

@export var path : String
@export var level_door_origin : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var x = 0
	for lvl_path in get_level_paths():
		add_child(create_level_door(lvl_path, x))
		x += 50
	


func create_level_door(lvl : String, x_pos):
	var d : LevelDoor = level_door_origin.instantiate()
	d.position.x = x_pos
	d.level = load(lvl)
	var name = lvl.erase(0, path.length())
	name = name.erase(0, name.find("/", 0) + 1)
	name = name.erase(name.length() - 5 , 5)
	d.level_name = name
	return d

func get_level_paths():
	var directories = search_dir(path)["directories"]
	var files = []
	for dir in directories:
		for file in search_dir(dir)["files"]:
			if file.ends_with(".tscn"):
				files.append(file)
	return files

func search_dir(_path):
	var result = {"directories": [], "files": []}
	var dir = DirAccess.open(_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				result["directories"].append(_path + file_name)
			else:
				result["files"].append(_path + "/" + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return result
