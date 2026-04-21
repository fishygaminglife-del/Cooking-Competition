extends Node2D

var area = 0

func _ready() -> void:
	$CuttingUI.visible = false
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	$PizzaBase.visible = false
	$Panel.visible = false
	$Coffe.visible = false
	$Cheeseonpizza.visible = false
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("interact"):
		if area == 1:
			$Node2D.SPEED = 0
			$Panel.visible = true
			$CuttingUI.visible = true
		elif area == 2:
			if $FruitSmoothie.visible == true:
				$FruitSmoothie.visible = false
				await get_tree().create_timer(0.5).timeout
				$Smoothie.visible = true
		elif area == 3:
			$Node2D.SPEED = 0
			$Panel.visible = true
			$PizzaBase.visible = true
		elif area == 4:
			$audio/coffemake.play()
			await get_tree().create_timer(0.7).timeout
			$Coffe.visible = true
			$audio/coffemake.stream_paused = true
		elif area == 5:
			#$Node2D.SPEED = 0
			#$Panel.visible = true
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
	$Node2D.SPEED = 150

func _on_mixing_body_exited(body: Node2D) -> void:
	$mixing/Mixe.visible = false
	$Node2D.SPEED = 150
func _on_pizza_body_exited(body: Node2D) -> void:
	$pizza/pizzae.visible = false
	$Node2D.SPEED = 150
func _on_coffe_body_exited(body: Node2D) -> void:
	$coffe/coffee.visible = false
	$Node2D.SPEED = 150
func _on_packing_body_exited(body: Node2D) -> void:
	$packing/packe.visible = false
	$Node2D.SPEED = 150



	
