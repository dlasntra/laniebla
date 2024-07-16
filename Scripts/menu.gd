extends CanvasLayer

func _on_button_pressed():
	Globals.next_scene = "res://Niveles/testeo.tscn"
	get_tree().change_scene_to_packed(Globals.loading_screen)

func _on_salir_pressed():
	get_tree().quit()

func _on_opciones_pressed():
	pass