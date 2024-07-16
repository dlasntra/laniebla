class_name interaccionable
extends CSGBox3D

signal accion(body)

func interact(body):
	print("Interacciona")
	emit_signal("accion", body)
