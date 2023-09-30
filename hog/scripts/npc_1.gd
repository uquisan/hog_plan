extends Node2D

@export_category("dialogo npc")
@export var caixa_dialogo: Array = [""]


@onready var texto: RichTextLabel = $dialog_box/texto

func _ready():
	texto.hide()
	pass

func _input(event):
	if event is InputEventKey and event.is_action_pressed("interaction"):
		show_mensage()

func show_mensage():
	if not $Timer.is_stopped():
		texto.visible_characters = texto.text.length()
		return
	var _msg = caixa_dialogo.pop_front()
	
	texto.visible_characters = 0
	$Timer.start()
	
	if _msg:
		texto.text = _msg
	else :
		texto.hide()


func _on_timer_timeout():
	if texto.visible_characters == texto.text.length():
		$Timer.stop()
		pass
	texto.visible_characters += 1

