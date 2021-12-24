extends Area2D
var direction = Vector2(1, 0)
var projectile_speed = 800

var Meteor_Scene = preload("res://Meteor.tscn")
var MeteorSmall1 = preload("res://Sprites/Meteorspr/MeteorSmall1.png")
var MeteorSmall2 = preload("res://Sprites/Meteorspr/MeteorSmall2.png")
var MeteorMed1 = preload("res://Sprites/Meteorspr/MeteorMed1.png")
var MeteorMed2 = preload("res://Sprites/Meteorspr/MeteorMed2.png")
var MeteorBig = preload("res://Sprites/Meteorspr/MeteorBig.png")



func _process(delta):
	randomize()
	self.position += direction.rotated(rotation)*projectile_speed*delta
	
	


func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	queue_free()







func _on_BulletSub_area_entered(area):
	if( "Meteor" in area.get_name()):
		Global.Score +=10
		get_node("../AsteroidSpawner").remove_child(area)
		if(area.get_node("Sprite").texture == MeteorBig ):
			for _i in range(randi()%2+2):
				var meteor1 = Meteor_Scene.instance()
				meteor1.position = Vector2(area.position.x +rand_range(-0.2, 0.2), area.position.y + rand_range(-0.2, 0.2))
				get_node("../AsteroidSpawner").add_child(meteor1)

		elif(area.get_node("Sprite").texture == MeteorMed1 or area.get_node("Sprite").texture == MeteorMed2):
			for _i in range(2):
				var meteor1 = Meteor_Scene.instance()
				meteor1.position = Vector2(area.position.x +rand_range(-0.2, 0.2), area.position.y + rand_range(-0.2, 0.2))
				get_node("../AsteroidSpawner").add_child(meteor1)
		queue_free()
		area.queue_free()
