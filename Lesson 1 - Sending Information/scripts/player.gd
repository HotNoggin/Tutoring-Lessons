class_name Player
extends Node2D

# Static variables are shared by all of the instances of a class
# (so every Player will have the same value for "instance")
# This static variable will hold the last player added to the scene!
static var instance: Player
# This static list will hold ALL of the players in the scene!
static var all_players: Array[Player]
@export var health: HealthComponent


# _enter and _exit_tree() are called when the node is added to or removed from the tree
# You can use them to create "setup" and "cleanup" behavior
func _enter_tree():
	all_players.append(self)

func _exit_tree():
	all_players.erase(self)


# Ready is called once, when the node is ready to go
func _ready():
	instance = self
	# You can connect signals to existing methods, too
	health.drained.connect(queue_free)


# Process is called once each time the screen refreshes
func _process(_delta):
	if Input.is_action_just_pressed("down"):
		health.value -= 10
	if Input.is_action_just_pressed("up"):
		health.value += 10
