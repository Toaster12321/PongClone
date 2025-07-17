#Ball needs to bounce off of walls and player bars
#must spawn in middle of screen and chose a random direction to shoot in 
#must dissapear when a player scores a goal ( ball enters a destroy zone past player bar)
class_name Ball extends CharacterBody2D

const DIR_4 = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP ] 

@export var move_speed : float # ball speed 


func _ready() -> void:
	#ball_state_machine.initialize( self )
	set_velocity_speed()
	pass


func _physics_process(delta: float) -> void: #ball physics
	move_and_slide()
	var col : KinematicCollision2D = move_and_collide(velocity) #ball collides based on velocity 
	if col: #if theres a collision get the normal and bounce it in the opposite direction
		var normal : = col.get_normal() 
		velocity = velocity.bounce(normal)
	pass


func set_velocity_speed() -> void: # sets velocity to our move speed and shoots in a random direction
	var rand_angle = randf_range(-PI / 4, PI / 4) # angle between -45 and 45 degrees
	var rand_direction = Vector2(1, 0).rotated(rand_angle) # rotates the vector by our random angle
	if randf() > 0.5: #if the randf between 0 and 1 is greater than 0.5 choose right, otherwise left
		rand_direction.x *= 1
	else:
		rand_direction *= -1
	velocity = rand_direction.normalized() * move_speed #equation for velocity shooting in rnadom direction
	pass
