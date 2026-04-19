extends Node2D

var area = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if area == 1:
			pass
		elif area == 2:
			pass
		elif area == 3:
			pass
		elif area == 4:
			pass
		elif area == 5:
			pass
func _on_chopping_body_entered(body: Node2D) -> void:
	area = 1
	$chopping/Chope.visible = true
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false


func _on_mixing_body_entered(body: Node2D) -> void:
	area = 2
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = true
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false


func _on_pizza_body_entered(body: Node2D) -> void:
	area = 3
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = true
	$coffe/coffee.visible = false
	$packing/packe.visible = false


func _on_coffe_body_entered(body: Node2D) -> void:
	area = 4
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = true
	$packing/packe.visible = false

func _on_packing_body_entered(body: Node2D) -> void:
	area = 5
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = true


func _on_chopping_body_exited(body: Node2D) -> void:
	$chopping/Chope.visible = false


func _on_mixing_body_exited(body: Node2D) -> void:
	$mixing/Mixe.visible = false


func _on_pizza_body_exited(body: Node2D) -> void:
	$pizza/pizzae.visible = false


func _on_coffe_body_exited(body: Node2D) -> void:
	$coffe/coffee.visible = false


func _on_packing_body_exited(body: Node2D) -> void:
	$packing/packe.visible = false
