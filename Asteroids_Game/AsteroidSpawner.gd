extends Node

var asteroid_scene = preload("res://Meteor.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	_spawn_asteroid()


func _spawn_asteroid():
	var asteroid = asteroid_scene.instance()
	asteroid.position = Vector2(rand_range(get_viewport().size.x -5, get_viewport().size.x +5 ),rand_range(get_viewport().size.y -5, get_viewport().size.y +5 ) )
	add_child(asteroid)


func _on_SpawnTimer_timeout():
	_spawn_asteroid()
	if($SpawnTimer.wait_time>= 1.25):
		$SpawnTimer.wait_time -= 0.05

	
