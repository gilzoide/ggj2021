extends WorldEnvironment

onready var TweenNode = get_node("Tween")
onready var dayZenith = Color(78, 202, 246, 255)
onready var nightZenith = Color(28, 10, 77, 255)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func main(setZenith):
	if (setZenith == true and (self.background_color == dayZenith or self.background_color == nightZenith)): # Se ele está no zênite
		pass
	elif (setZenith == true and self.background_color == dayZenith):
			TweenNode.interpolate_property(self, "background/color", dayZenith, 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
