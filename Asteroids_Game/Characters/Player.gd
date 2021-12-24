extends KinematicBody2D


var input_vector: Vector2
var velocity: Vector2
export (int) var acceleration = 200
export (int) var max_speed =  400
var rotation_dir = 0
export (float) var rotation_speed = 3.5
export (float) var friction_weight = 0.01

export (float) var bullet_speed = 4

var Score = 0

func _input(_event):
	rotation_dir = 0
	input_vector.x = Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	
	if(Input.is_action_pressed("strafe_right")):
		rotation_dir +=1
	elif(Input.is_action_pressed("strafe_left")):
		rotation_dir -=1

func _physics_process(delta):
	velocity += Vector2(input_vector.x*acceleration*delta, 0).rotated(rotation) 
	
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
	
	if(input_vector.x == 0):
		velocity = lerp(velocity, Vector2.ZERO, friction_weight)
		if(abs(velocity.x) <= 0.1):
			velocity.x = 0
		if(abs(velocity.y) <= 0.1):
			velocity.y = 0
	rotation += rotation_dir*rotation_speed*delta
	velocity = move_and_slide(velocity)
	
	position.x = wrapf(position.x, 0, get_viewport().size.x + 0.5)
	position.y = wrapf(position.y, 0, get_viewport().size.y + 0.5)

func _unhandled_key_input(event):
	if(event.is_action_pressed("shoot")):
		$Bullet2.shoot()





func _on_Area2D_area_entered(area):
	if( "Meteor" in area.get_name()):
		Global.Score = 0
		get_tree().reload_current_scene()

