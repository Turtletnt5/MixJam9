extends CharacterBody2D

@export var speed : float = 25
@export var gravity : float = 20

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _physics_process(_delta):
	
	velocity.y = gravity * _delta
	
	var direction = Input.get_axis("Player_left", "Player_right")
	velocity.x = direction * speed
	if direction == 0:
		animated_sprite.play("Idle")
	else:
		if direction > 0:
			animated_sprite.play("MoveRight")
		else:
			animated_sprite.play("MoveLeft")
		
	
	move_and_slide()
