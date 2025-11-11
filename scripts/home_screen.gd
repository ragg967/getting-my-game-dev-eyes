extends Control

const LEVEL_SELECTER: String = "res://scenes/level_selecter.tscn"


func _on_play_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", LEVEL_SELECTER)

func _on_options_pressed() -> void:
	print("Opened options")

func _on_exit_pressed() -> void:
	get_tree().quit()
