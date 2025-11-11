extends Control

@onready var gridContainer: GridContainer = $CenterContainer/GridContainer

var levelFolder: String = "res://levels/"
var levels: PackedStringArray
var buttonScript = preload("res://scripts/button.gd")
var levelPrefix: String = "level"

func _ready() -> void:
	for level in DirAccess.get_files_at(levelFolder):
		levels.append(levelFolder + level)
		var button = Button.new()
		button.name = levelPrefix + "_" + str(level.to_int())
		print(button.name)
		button.text = str(level.split("_")[0] + " " + str(level.split("_")[1].to_int()))
		button.set_script(buttonScript)
		gridContainer.add_child(button)
