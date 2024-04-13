extends CharacterBody2D

const speed : float = 25
const gravity : float = 20
const coolDownTime : float = 2.5

@onready var animated_sprite = $AnimatedSprite2D
@onready var AttackCoolDown = $AttackCoolDown

var AttackReady : bool = true

var bowlingBall = preload("res://MyStuff/Player/bowling_ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(_event):
	
	if Input.is_action_just_pressed("Attack"):
		Attack()

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

func Attack():
	if AttackReady:
		var b = bowlingBall.instantiate()
		b.start($BallSpawn.global_position, 0)
		get_tree().root.add_child(b)
		AttackReady = false
		AttackCoolDown.start(coolDownTime)

func AttackOffCoolDown():
	AttackReady = true

func ballHit():
	pass
