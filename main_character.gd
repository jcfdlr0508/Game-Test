extends CharacterBody2D

@onready var sprite_2d = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const double_jumped = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped: bool = false


func _physics_process(delta):
	#Animation
	if (velocity.x >1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "idle" 
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	else:
		has_double_jumped = false
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif not has_double_jumped:
			velocity.y = double_jumped
			has_double_jumped = true
			sprite_2d.animation = "double_jump"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		sprite_2d.flip_h = direction < 0 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	#var isLeft = velocity.x < 0
	#sprite_2d.flip_h = isLeft
