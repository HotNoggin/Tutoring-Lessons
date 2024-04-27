extends Area2D

@export var rotation_speed: float = 90


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	rotation_degrees += delta * rotation_speed


func _on_body_entered(body: Node2D):
	if body is Player:
		queue_free()
