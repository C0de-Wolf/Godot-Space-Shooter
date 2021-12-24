extends Node

var bullet_scene = preload("res://Bullet/BulletR.tscn")


func _ready():
	pass # Replace with function body.

func shoot():
	var bullet = bullet_scene.instance()
	bullet.global_position = get_parent().global_position
	bullet.rotation = get_parent().rotation
	get_node("/root/World").add_child(bullet)


