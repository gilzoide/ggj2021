extends Label


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(PlayerVars.camera_speed * 100) + "%"

func refresh():
	text = str(PlayerVars.camera_speed * 100) + "%"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
