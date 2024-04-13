extends CharacterBody2D

const speed = 5
const accel = 5

@export var lives : int = 1

@onready var animated_sprite = $AnimatedSprite2D
@onready var LivesLabel = $Label

signal deathsignal()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	LivesLabel.text = str(lives)

func _physics_process(delta):
	
	if velocity.y < speed:
		velocity.y += accel * delta
	if velocity.y > speed:
		velocity.y = speed
		
	if velocity.x != 0:
		
		if velocity.x < accel && velocity.x > -accel:
			velocity.x = 0
		else: 
			if velocity.x > accel:
				velocity.x -= accel
			else:
				velocity.x += accel
		
	
	
	move_and_slide()
	

	if !animated_sprite.is_playing():
		animated_sprite.play("Walk")
	

func Hit(normal):
	
	velocity = velocity.bounce(-normal)
	velocity.y *= 2
	velocity.x *= 10
	
	lives -= 1
	LivesLabel.text = str(lives)
	
	if lives <= 0:
		deathsignal.emit()
		queue_free()
