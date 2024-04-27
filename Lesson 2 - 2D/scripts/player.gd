class_name Player
extends CharacterBody2D

@export var speed: float = 36
@export var gravity: float = 200
@export var jump_intensity: float = 130

var time_since_jump_pressed: float = 0


func _physics_process(delta: float) -> void:
	# You use delta when changing a value, not when setting it
	velocity.x = Input.get_axis("left", "right") * speed
	velocity.y += gravity * delta
	
	# Reset jump if it's pressed
	if Input.is_action_just_pressed("up"):
		time_since_jump_pressed = 0
	
	# Increase the jump timer
	time_since_jump_pressed += delta
	time_since_jump_pressed = clamp(time_since_jump_pressed, 0, 100)
	
	# Jump if the timer hasn't passed much
	if is_on_floor() and time_since_jump_pressed <= 0.25:
		velocity.y = -jump_intensity
		time_since_jump_pressed = 0
	
	# This is one method you can use to move a characterbody
	# Unlike move_and_collide(), it "fixes" velocity after a collision
	move_and_slide()
