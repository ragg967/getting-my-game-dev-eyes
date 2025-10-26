extends Control

func _ready() -> void:
	$BackGround.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_respawn_pressed() -> void:
	get_tree().paused = false
	var currentPath = get_tree().current_scene.scene_file_path
	get_tree().call_deferred("change_scene_to_file", currentPath) # need deferred or it crys

func _on_quit_pressed() -> void:
	get_tree().quit()
