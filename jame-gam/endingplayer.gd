extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 40.0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		if velocity.x == 0:
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("still")

	#doesnt need to handle left inputs
	var direction := Input.get_axis("ui_left", "Right")
	direction = max(0,direction)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
