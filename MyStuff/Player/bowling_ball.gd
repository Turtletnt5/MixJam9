extends CharacterBody2D


var speed = 75

func start(_position, _direction):
	
	position = _position
	velocity = Vector2(0, -speed)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		#velocity.y -= speed
		#if velocity.y > speed:
			#velocity.y = speed
		
		if collision.get_collider().has_method("Hit"):
			collision.get_collider().Hit(collision.get_normal())
		if collision.get_collider().has_method("ballHit"):
			queue_free()
			
	
	rotation += 0.5
