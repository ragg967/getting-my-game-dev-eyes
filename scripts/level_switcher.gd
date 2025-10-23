extends Area2D
class_name LevelSwitcher

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var currentPath = get_tree().current_scene.scene_file_path # get file path
		# replace the currnet path with the next levels
		var nextPath = currentPath.replace(currentPath.get_file().get_basename(), 
											 "level_" + str(currentPath.get_file().get_basename().split("_")[-1].to_int() + 1))
		get_tree().call_deferred("change_scene_to_file", nextPath) # need deferred or it crys
