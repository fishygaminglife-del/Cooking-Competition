extends CharacterBody2D

var SPEED = 150

func _physics_process(delta):
	topdown_movement(delta)
	move_and_slide()

func topdown_movement(delta):
	var directionx = Input.get_axis("left", "right")
	var directiony = Input.get_axis("up", "down")

	velocity.x = directionx * SPEED
	velocity.y = directiony * SPEED

	#if directionx == 0 and directiony == 0:
		#if last_facing == 0:
			#$MCCharater.play("downidle")
		#elif last_facing < 0:
			#$MCCharater.play("sideidle2")
		#elif last_facing > 0:
			#$MCCharater.play("sideidle")
			
	#else:
		#if directiony < 0:
			#$MCCharater.play("up")
			#last_facing = 0
		#elif directiony > 0:
			#last_facing = 0
			#$MCCharater.play("down")
		#elif directionx < 0:
			#last_facing = 1
			#$MCCharater.play("side")
		#elif directionx > 0:
			#last_facing = -1
			#$MCCharater.play("side2")
