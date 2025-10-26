extends Node

func _ready() -> void:
	if OS.has_feature("web"):
		# Web build - stay in canvas
		pass
	elif not OS.has_feature("editor"):
		# Desktop export - go fullscreen
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
