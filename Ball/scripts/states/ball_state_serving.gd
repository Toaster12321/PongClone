class_name BallStateServing extends BallState

@export var wander_speed : float = 400.0
@export var timer : float = 0.1
@export var next_state : BallState

var _direction : Vector2

#what happens when we initialize this state?
func init() -> void:
	pass


#what happens when the ball enters this state?
func enter() -> void:
	var rand = randi_range( 0, 3 ) # shoot ball in a random direction 
	_direction = ball.DIR_4[ rand ]
	ball.velocity = _direction * wander_speed
	pass


# what happens when the ball exits this state?
func exit() -> void:
	pass


#what happens during the _process update in this state?
func process(_delta : float) -> BallState:
	timer -= _delta
	if timer <= 0:
		return next_state
	return null


#what happens during the _physics_process update in this state?
func physics(_delta : float) -> BallState:
	return null
