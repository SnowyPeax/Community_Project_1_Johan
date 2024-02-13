extends Node2D

@export var path : String

# Called when the node enters the scene tree for the first time.
func _ready():
	get_levels()

func get_levels():
	var directories = search_dir(path)["directories"]
	var files = []
	for dir in directories:
		files.append_array(search_dir(dir)["files"])
	print(files)

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
				result["files"].append(_path + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return result
