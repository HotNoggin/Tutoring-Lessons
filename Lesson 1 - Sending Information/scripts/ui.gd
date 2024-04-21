extends CanvasLayer

# Export variables are a safe way to reference other nodes in the scene
# If the nodes are moved or renamed, the reference stays intact, unlike paths
@export var health_bar: ProgressBar
@export var player: Player


func _ready():
	# You can access static variables from any script using NameOfClass.variable_name
	print(Player.instance)
	# Connecting signals in code is done with this syntax:
	# object.signal.connect(other_object.function_name)
	player.health.changed.connect(_health_changed)


# Since we connected this function, it will be called when the signal is emitted
# The function parameters much match the signal's (in their order and type)
func _health_changed(value: int):
	health_bar.value = value
