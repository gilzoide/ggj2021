extends WindowDialog

func go_to_ilha1():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	PlayerVars.viaja_ilha(PlayerVars.Ilha.IlhaCaminho)

func go_to_ilha2():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	PlayerVars.viaja_ilha(PlayerVars.Ilha.IlhaEscura)

func go_to_ilha3():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	PlayerVars.viaja_ilha(PlayerVars.Ilha.IlhaEstatua)

func go_to_ilha_central():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	PlayerVars.viaja_ilha(PlayerVars.Ilha.IlhaCentral)

func open_popup():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	popup()
