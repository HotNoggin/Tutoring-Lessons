extends Node2D
## This class does something

# You can use "Player" as a type because we've done "class_name Player" in another script
# That gave our Player class a name and made it accessible anywhere
@export var player: Player ## The node to rotate


## This function does this
func _ready():
	# You can change the properties of any object if you have a reference to it!
	player.rotation_degrees = 180
	player.health.value = 100


func _process(delta):
	# Using "is_instance_valid()" makes sure the code only runs if the player exists
	if is_instance_valid(player):
		player.rotation_degrees += 50 * delta
