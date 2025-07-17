class_name BallStateMachine extends Node

#array of ball states
var states : Array[ BallState ]
var prev_state : BallState
var current_state : BallState


func _ready() -> void: # we dont want this node to do anything in runtime except switch states so we disable it
	process_mode = Node.PROCESS_MODE_DISABLED
	pass


func _process(delta: float) -> void:
	change_state( current_state.process(delta) ) # change state in the process function with each delta frame
	pass


func _physics_process(delta: float) -> void:
	change_state( current_state.physics(delta) ) # change state in the physics function with each delta frame
	pass


func initialize( _ball : Ball ) -> void:
	states = [] #empty array
	
	for c in get_children(): #get children of this node and append the states to the array
		if c is BallState:
			states.append( c )
	
	
	for s in states: #iterate through each state and initialize the ball and state machine 
		s.ball = _ball
		s.state_machine = self
		s.init()
	
	if states.size() > 0: # if we have any states change the state to the first state and set it to enabled
		change_state( states[0] )
		process_mode = Node.PROCESS_MODE_INHERIT
	
	pass


func change_state( _new_state : BallState ) -> void: # function to change states
	if _new_state == null || _new_state == current_state: # if the new state doesn't exist or the state doesnt change skip the function
		return
	
	if current_state: #if we are in the current state exit this state
		current_state.exit()
	
	#prepare to switch states
	prev_state = current_state #current state is now the previous state
	current_state = _new_state #the current state is the new state
	current_state.enter() #enter this new state
	
	pass
