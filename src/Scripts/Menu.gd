extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func go_to_ilha1():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Ilhas/IlhaCaminho/IlhaCaminho.tscn")
	pass

func go_to_ilha2():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Ilhas/IlhaEscura/IlhaEscura.tscn")
	pass

func go_to_ilha3():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Ilhas/IlhaEstatuas/IlhaEstatuas.tscn")
	pass
	
func open_popup():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	popup()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
