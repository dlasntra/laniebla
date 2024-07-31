# DIARIO DE DESARROLLO

> En el _DIARIO DE DESARROLLO_ se incluirán todos los cambios efectuados en el código del juego a manera de cronograma y apuntes para el uso de mecánicas en el desarrollo del mismo.

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

- El color asignado a sido el blanco
	- Hexadecimal: #FFFFFF.

### Entradilla - 16 de Julio de 2024[^1]

[^1]: Las entradillas son un formato menor a las entradas para indicar cambios menores en el proyecto.

1. Se han creado las carpetas de Música y SFX.
2. Se ha insertado los archivos "Menú Principal.wav" y "Música Radio.wav" en la carpeta de Música.
3. Se ha predispuesto el archivo "Menú Principal.wav" como cabecera de música de la escena menú.
4. Se ha modificado la propiedad de importación del archivo "Menú principal.wav" en ```bucle```.
5. Se ha eliminado el borde blanco de los botones de la escena menú.

### Entradilla - 24 de Julio de 2024

1. Creada la carpeta de menú.
2. Añadida en la carpeta menú el archivo "menu-fondo-animado.ogv".
3. Eliminación del ColorRect de la escena menú.
4. Creación de VideoStreamPlayer.
5. Adjuntado como vídeo de reproducción al VideoStreamPlayer el archivo _menu-fondo-animado.ogv_
6. Activadas las opciones de ```autoplay``` y ```loop``` en el **VideoStreamPlayer**.
7. Modificación del color del texto del menú: Cambiado a gris oscuro.
	1. Hex: #808080.[^2]
[^2]: Los colores se representarán en el **DIARIO DE DESARROLLO** en formato hexadecimal, para una fácil implementación en el motor gráfico.

## Séptima Entrada

1. Introducidas las entradas para las acciones de: adelante, atrás, izquierda, derecha, salto y acción con mando.
	1. Adelante: Joystick Izquierdo - Arriba.
	2. Atrás: Joystick Izquierdo - Abajo.
	3. Izquierda: Joystick Izquierdo - Izquierda.
	4. Derecha: Joystick Izquierdo - Derecha.
	5. Salto: Cuadrado.
	6. Acción: Cruz.

2. Cambiada la acción del script **jugador[^3]** de "ui_accept" a la acción saltar para la compatibilidad con mando.
	1. Antes:
	```gdscript
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	```
	2. Después:
	```gdscript
		if Input.is_action_just_pressed("Saltar") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	```

[^3]: Línea 32 y 33 del script de *jugador*.