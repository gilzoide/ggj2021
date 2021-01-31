extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label3.text = str(PlayerVars.camera_speed * 100) + "%"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Label3_ready():
	pass # Replace with function body.


func _on_PlusSensitivity_pressed():
	PlayerVars.camera_speed += 0.05
	$Label3.refresh()


func _on_MinusSensitivity_pressed():
	PlayerVars.camera_speed -= 0.05
	$Label3.refresh()


func _on_Return_pressed():
	self.hide()
	get_node("../Pause_Screen").show()
