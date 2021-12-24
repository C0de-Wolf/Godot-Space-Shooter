extends Area2D

var MeteorSmall1 = preload("res://Sprites/Meteorspr/MeteorSmall1.png")
var MeteorSmall2 = preload("res://Sprites/Meteorspr/MeteorSmall2.png")
var MeteorMed1 = preload("res://Sprites/Meteorspr/MeteorMed1.png")
var MeteorMed2 = preload("res://Sprites/Meteorspr/MeteorMed2.png")
var MeteorBig = preload("res://Sprites/Meteorspr/MeteorBig.png")




var MeteorSprites = [MeteorSmall1, MeteorSmall2, MeteorMed1, MeteorMed2, MeteorBig]
var MaxSpeed = rand_range(-5,5)
export (float) var rotationSpeed = 0.05
var RandomDirx = rand_range(-MaxSpeed,MaxSpeed)
var RandomDiry = rand_range(-MaxSpeed,MaxSpeed)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var SpriteChooser = rand_range(0, len(MeteorSprites))
	get_node("Sprite").set_texture(MeteorSprites[SpriteChooser])
	if(get_node("Sprite").texture == MeteorSmall1 or get_node("Sprite").texture == MeteorSmall2):
		get_node("CollisionShape2D").shape.radius = 11
	if(get_node("Sprite").texture == MeteorMed1 or get_node("Sprite").texture == MeteorMed2):
		get_node("CollisionShape2D").shape.radius = 16
	if(get_node("Sprite").texture == MeteorBig):
		get_node("CollisionShape2D").shape.radius = 24
	
	

	
func _physics_process(_delta):
	rotation += rotationSpeed
	position += Vector2(RandomDirx, RandomDiry) 
	position.x = wrapf(position.x, 0, get_viewport().size.x + get_node("CollisionShape2D").shape.radius/4*3)
	position.y = wrapf(position.y, 0, get_viewport().size.y + get_node("CollisionShape2D").shape.radius/4*3)




			
		
		

