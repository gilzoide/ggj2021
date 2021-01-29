extends KinematicBody

const INTERACTABLE_COLLISION_BIT = 2

export(float) var speed = 5
export(float) var rotate_speed = 45
export var gravity = Vector3.DOWN * 10
var velocity = Vector3.ZERO

var focused_interactable_object : Node = null
onready var animation_player = $AnimationPlayer

func _ready() -> void:
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact", false):
		try_interact()

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

func try_interact():
	if focused_interactable_object and focused_interactable_object.has_signal("interact"):
		focused_interactable_object.emit_signal("interact")

func focus_object(body : Node) -> void:
	if focused_interactable_object:
		unfocus_object(body)
	focused_interactable_object = body
	if focused_interactable_object.has_signal("start_interactable"):
		focused_interactable_object.emit_signal("start_interactable")

func unfocus_object(body : Node) -> void:
	if focused_interactable_object.has_signal("stop_interactable"):
		focused_interactable_object.emit_signal("stop_interactable")
	focused_interactable_object = null

func _on_InteractArea_body_entered(body: PhysicsBody) -> void:
	if body.get_collision_layer_bit(INTERACTABLE_COLLISION_BIT):
		focus_object(body)

func _on_InteractArea_body_exited(body: PhysicsBody) -> void:
	if body == focused_interactable_object:
		unfocus_object(body)
