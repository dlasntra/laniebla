# DIARIO DE DESARROLLO

## Primera Entrada

- Se ha cambiado la visibilidad de público a privado.

### Anexo a la entrada

- Se ha creado el árbol de directorios del proyecto.

- Se ha creado la escena testeo.

- Se ha creado al prefabricado del jugador.
- Se ha añadido el terreno en la escena testeo.

- Se ha programado los movimientos del jugador.

- Se ha añadido un HDRI como cielo a la escena testo.

- Se ha añadido una Luz direccional a la escena testeo.

**ERRORES**

- ~El jugador no colisiona con el terreno.~ _Solucionado_

## Segunda Entrada

- Se ha configurado el movimiento de la camera.

- Se ha configurado que cuando se presionen las teclas de configuración, el jugador vaya al lugar en donde está mirando la cámara.

- Se ha texturizado el terreno de color verde.

- Se ha creado un grupo con Props de caja en el mapa testeo.

## Tercera Entrada

- Se ha creado el shader de PSX para modelos.

- Se ha creado el shader de post-pro CRT para la televisión.

- Se ha creado el shader PSX para post-pro.

- Se ha embebido los objetos y jugador en un Subviewport con padre en Subviewport Controller para aplicar la post-pro de PSX.

## Cuarta Entrada

- Se ha creado un trazado de rayo.

- Sobre esa rayo se ha montado la estructura del sistema de interacción (Ahora el jugador puede interaccionar con determinados objetos y aparece un texto que así lo índica).

- Gran parte se estructura en el script RayCast3D.

**_Codigo correspondiente al script RayCast3D_**

~~~gdscript

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

~~~

- La otra parte, pequeña hasta ahora en el desarrollo, se estructura en el script interaccionable.

**_Código correspondiente al script interaccionable_**

~~~gdscript

class_name interaccionable
extends CSGBox3D

signal accion(body)

func interact(body):
	print("Interacciona")
	emit_signal("accion", body)

~~~

## Quinta Entrada

- Se ha creado la escena de pantalla de carga.

- Se ha creado el script de la pantalla de carga para animar la barra de progreso.

- Se ha creado un script global para autoload.

- Se ha añadido el script global para autoload.

### De esta entrada es lo más importante

- La secuencia de activación para transitar de escena X a escena Y mediante una pantalla de carga es:

~~~gdscript
Globals.next_scene = "res://Niveles/escena.tscn"
get_tree().change_scene_to_packed(Globals.loading_screen)
~~~

- Se ha creado la escena menu.

- Se ha hecho principal la escena de menu al cargar el programa.

## Sexta Entrada

### Menú Principal

- Se ha añadido las fuentes al proyecto.

- Se ha cambiado el color del color rect en la escena menú a un color granate.

- Se ha cambiado la fuente del título del juego.

- Se han creados dos nuevos botones.

- Se han cambiado las fuente de los botones.

- Se ha creado la lógica para el botón de "Salir".

- Se ha alineado el título y los botones a la izquierda de la pantalla.

- Se ha añadido el texto de derechos de autor.

- Se ha centrado el texto de derechos de autor en el bajo-centro de la pantalla.

### Pantalla de Carga

- Se ha cambiado la fuente al texto de "Cargando".

- Se ha creado el archivo "progressbar_color" para asignarle un color a la barra de progreso de carga.

- Se le ha asignado al objeto de **progressbar**.

<<<<<<< HEAD
- El color asignado a sido el blanco
	- Hexadecimal: #FFFFFF.

### Entradilla - 16 de Julio de 2024

1. Se han creado las carpetas de Música y SFX.
2. Se ha insertado los archivos "Menú Principal.wav" y "Música Radio.wav" en la carpeta de Música.
3. Se ha predispuesto el archivo "Menú Principal.wav" como cabecera de música de la escena menú.
4. Se ha modificado la propiedad de importación del archivo "Menú principal.wav" en ```bucle```.
5. Se ha eliminado el borde blanco de los botones de la escena menú.
=======
- El color asignado a sido el blanco.
	- Hexadecimal: #FFFFFF.
>>>>>>> 1bc1638b72fd04d7dbf8d2c5269ce6d88539e82d