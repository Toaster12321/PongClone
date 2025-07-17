class_name BalLStateBouncing extends BallState


#what happens when we initialize this state?
func init() -> void:
	pass


#what happens when the ball enters this state?
func enter() -> void:
	pass


# what happens when the ball exits this state?
func exit() -> void:
	pass


#what happens during the _process update in this state?
func process(_delta : float) -> BallState:
	return null


#what happens during the _physics_process update in this state?
func physics(_delta : float) -> BallState:
	return null
