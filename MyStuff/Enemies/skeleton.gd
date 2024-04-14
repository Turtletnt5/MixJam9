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
	add_to_group("Skeletons")
	

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
		
	
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().has_method("LoseGame"):
			get_tree().call_group("victory", "MisstionFailed")
	

	if !animated_sprite.is_playing():
		animated_sprite.play("Walk")
	

func Hit(normal):
	
	$HitSound.play()
	
	velocity = velocity.bounce(-normal)
	velocity.y *= 2
	velocity.x *= 10
	
	lives -= 1
	LivesLabel.text = str(lives)
	
	if lives <= 0:
		
		get_tree().call_group("victory", "killedEnemy")
		queue_free()

func start(_position):
	position = _position
	
func setLife(_life):
	lives = _life

func suicide():
	queue_free()
