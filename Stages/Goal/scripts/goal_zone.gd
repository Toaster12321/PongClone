class_name GoalZone extends Node2D

const BALL_SCENE : PackedScene = preload("res://Ball/scenes/ball.tscn")

#score count
var p1_score : int = 0
var p2_score : int = 0

@onready var ball: Ball = $Ball
@onready var left_goal_zone: Area2D = $LeftGoalZone
@onready var right_goal_zone: Area2D = $RightGoalZone
@onready var p1_score_label: Label = $ScoreUI/P1Score
@onready var p2_score_label: Label = $ScoreUI/P2Score


func _ready() -> void:
	left_goal_zone.area_entered.connect( check_p2_goal_scored ) #connect both goals areas to monitor for a goal
	right_goal_zone.area_entered.connect( check_p1_goal_scored )
	pass


func check_p1_goal_scored( _right_goal_zone : Area2D ) -> void: #if p1 scores a goal on the left goal increase it
	p1_score += 1
	p1_score_label.text = str(p1_score)
	print("P1 Goal: ", p1_score)
	remove_and_respawn_ball()
	pass


func check_p2_goal_scored( _left_goal_zone : Area2D ) -> void: #if p2 scores a goal on the right goal increase it
	p2_score += 1
	p2_score_label.text = str(p2_score)
	print("P2 Goal: ", p2_score)
	remove_and_respawn_ball()
	pass


func remove_and_respawn_ball() -> void: # function to start game over once a goal is scored
	if ball != null:
		ball.queue_free() # get rid of the current ball
		
		await get_tree().process_frame # await a frame to make sure ball is gone
		
		var new_ball = BALL_SCENE.instantiate() # create a new ball to starting position
		new_ball.global_position = Vector2( 951, 554 )
		get_parent().add_child.call_deferred( new_ball )
		ball = new_ball #set old instance to new instance
		 
		var original_speed = ball.move_speed # store the old speed
		ball.move_speed = 0 # set to 0 on game start timer timeout
		
		await get_tree().create_timer(2).timeout # wait 2 seconds
		ball.move_speed = original_speed #start game with normal speed
		ball.set_velocity_speed()
