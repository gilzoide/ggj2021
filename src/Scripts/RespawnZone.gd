extends Area

export(Vector3) var respawn_position


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RespawnZone_body_entered(body):
	print_debug("body_entered")
	print_debug(str(body))
	if body.is_class("KinematicBody"):
		body.translation = respawn_position
