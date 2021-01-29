extends KinematicBody

export(float) var speed = 5
export(float) var rotate_speed = 45
export var gravity = Vector3.DOWN * 10
var velocity = Vector3.ZERO

onready var animation_player = $AnimationPlayer

func _ready() -> void:
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func get_input(delta):
	var delta_rotation: float = 0
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("move_left"):
		delta_rotation += rotate_speed
	if Input.is_action_pressed("move_right"):
		delta_rotation -= rotate_speed
	if delta_rotation:
		rotate_y(deg2rad(delta_rotation * delta))

	var movement: float = 0
	if Input.is_action_pressed("move_front"):
		velocity += transform.basis.z * speed
		movement += 1
	if Input.is_action_pressed("move_back"):
		velocity += -transform.basis.z * speed
		movement -= 1
	
	velocity.y = vy

	if movement:
		animation_player.play("Moving")
