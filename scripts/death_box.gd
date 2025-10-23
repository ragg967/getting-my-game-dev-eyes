extends Area2D
class_name DeathBox

@onready var deathScreen: Node = get_node("../../../DeathScreen")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.queue_free()
		ShowDeathScreen()

func ShowDeathScreen() -> void:
	deathScreen.visible = true
	get_tree().paused = true
