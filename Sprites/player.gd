extends CharacterBody2D

const SPEED = 300.0
var JUMP_VELOCITY = -500.0 #+(StatsManager.abilities[4].skill * 2)
var is_dead = false

func _process(delta):
	$ProgressBar.value = StatsManager.health
	if StatsManager.health <= 0 and not is_dead:
		die()

func die():
	print("User Dies")
	is_dead = true
	$AnimatedSprite2D.play("dying")
	await get_tree().create_timer(4).timeout  # adjust to match animation length
	print("Human dead")
	get_tree().change_scene_to_file("res://Levels/game_over.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var anim = $AnimatedSprite2D

	if not is_on_floor():
		anim.play("jump")
	elif direction != 0:
		anim.play("walk")
	else:
		anim.play("idle")

	# Flip the sprite to face left or right
	if direction != 0:
		anim.flip_h = direction < 0
