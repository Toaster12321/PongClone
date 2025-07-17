class_name Player1Bar extends CharacterBody2D

#Player 1 can move up and down with WASD
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
	
	if Input.is_action_pressed("p1_up"): #presses W
		velocity = Vector2.UP * move_speed
	if Input.is_action_just_released("p1_up"):
		velocity = Vector2.ZERO
	if Input.is_action_pressed("p1_down"): #presses S
		velocity = Vector2.DOWN * move_speed
	if Input.is_action_just_released("p1_down"):
		velocity = Vector2.ZERO
