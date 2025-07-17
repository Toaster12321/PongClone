class_name Player2Bar extends CharacterBody2D

#Player 2 can move up and down with arrow keys
#Bar should stop at top and bottom of screen, only being able to move in y axis 
#

@export var move_speed : float = 500 # move speed for player up/down

var direction : Vector2 = Vector2.ZERO

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void: # allows bar to slide
	move_and_slide()
	pass


func _process(delta: float) -> void: # velocity calculated with direction * speed per process frame delta
	
	if Input.is_action_pressed("p2_up"): #presses up arrow
		velocity = Vector2.UP * move_speed
	if Input.is_action_just_released("p2_up"):
		velocity = Vector2.ZERO
	if Input.is_action_pressed("p2_down"): #presses down arrow
		velocity = Vector2.DOWN * move_speed
	if Input.is_action_just_released("p2_down"):
		velocity = Vector2.ZERO
