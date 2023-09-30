extends CharacterBody2D

@export_category("movement")
@export var speed: int = 300

@export_category("vida")
@export var vida_player: int = 1500
@export var defesa: int = 150

func _physics_process(_delta):
	
	move()
	run()
func move():
	var direction: Vector2 = Vector2(
		Input.get_axis("esq", "dir"),
		Input.get_axis("cim", "bai")
	).normalized()
	
	velocity = direction * speed
	move_and_slide()
func run():
	if Input.is_action_pressed("run"):
		speed = 500
	else :
		speed = 300
		
func receber_dano(dano_base):
	var dano_atual = dano_base
	vida_player -= dano_atual
	print(vida_player)
	if vida_player < 0 :
		get_tree().reload_current_scene()
func _on_entered(hit_box):
	receber_dano(hit_box.damage)

