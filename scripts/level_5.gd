extends Node2D
const UP: String = "Up"
@onready var grabMe: Sprite2D = $Map/LockAndKey/GrabMe
@onready var key: AnimatedSprite2D = $Map/LockAndKey/Key
@onready var doorColi: CollisionShape2D = $Map/Front/DoorColi/CollisionShape2D
@onready var lockAndKey: Node2D = $Map/LockAndKey
@onready var player: Player = $Player
@onready var front: TileMapLayer = $Map/Front
var grabable: bool = false
var grabbed: bool = false
var inDropoffArea: bool = false

func _process(_delta: float) -> void:
	if grabable and not grabbed:
		if Input.is_action_just_pressed(UP):
			grabbed = true
			grabMe.visible = false
	
	if grabbed:
		key.global_position.y = player.global_position.y - 10 
		key.global_position.x = player.global_position.x - 10
		key.modulate = Color(0.716, 0.716, 0.716, 1.0)
		
		if inDropoffArea and Input.is_action_just_pressed(UP):
			front.modulate = Color(0.643, 0.643, 0.643, 0.663)
			doorColi.disabled = true
			grabbed = false
			lockAndKey.queue_free()

func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		grabMe.visible = true
		grabable = true

func _on_pickup_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		grabMe.visible = false
		grabable = false

func _on_dropoff_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inDropoffArea = true

func _on_dropoff_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inDropoffArea = false
