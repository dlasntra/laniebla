extends RayCast3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@onready var texto_accion = $GUI/Accion

func _process(delta):
	var detectar = get_collider()
	
	if get_collider():
		if detectar is interaccionable:
			texto_accion.show()
			if Input.is_action_just_pressed("Accion"):
				detectar.interact(owner)
	else:
		texto_accion.hide()
	
		
