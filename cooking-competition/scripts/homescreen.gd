extends Node2D

var in_chopping = false
var in_mixing = false
var in_pizza = false
var in_coffee = false
var in_packing = false
var in_bake = false
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
func update_area():
	if in_chopping:
		area = 1
	elif in_mixing:
		area = 2
	elif in_pizza:
		area = 3
	elif in_coffee:
		area = 4
	elif in_packing:
		area = 5
	elif in_bake:
		area = 6
	else:
		area = 0
func _input(event):
	if event.is_action_pressed("interact"):
		if area == 1:
			if not $FruitSmoothie.visible and not $Smoothie.visible:
				$Node2D.SPEED = 0
				$Panel.visible = true
				$CuttingUI.visible = true
		elif area == 2:
			if $FruitSmoothie.visible == true:
				$FruitSmoothie.visible = false
				await get_tree().create_timer(0.5).timeout
				$Smoothie.visible = true
		elif area == 3:
			if not $Pizza.visible and not $Cookedpizza.visible:
				$Node2D.SPEED = 0
				$Panel.visible = true
				$PizzaBase.visible = true
		elif area == 4:
			$audio/coffemake.play()
			await get_tree().create_timer(0.7).timeout
			$Coffe.visible = true
			$audio/coffemake.stream_paused = true
		elif area == 5:
			if not $Cookedpizza.visible:
				if not $Pizza.visible:
					$Banner/pizzaprint.text = "need to have pizza"
				else:
					$Banner/pizzaprint.text = "need to cook pizza"
			if not $Smoothie.visible:
				if not $FruitSmoothie.visible:
					$Banner/smoothieprint.text = "chop vegetables"
				else:
					$Banner/smoothieprint.text = "mix vegetables"
			if not $Coffe.visible:
				$Banner/coffeprint.text = "brew coffe"
			
			if 	$Cookedpizza.visible and $Coffe.visible and $Smoothie.visible:
				$Banner/pizza.text = ""
				$Banner/coffe.text = ""
				$Banner/smoothieprint.text = "completed"
				$PackedOrder.visible = true
			$AnimationPlayer.play("banner_move")
		elif area == 6:
			if $Pizza.visible == true:
				await get_tree().create_timer(0.3).timeout
				$Pizza.visible = false
				$Cookedpizza.visible = true
				if $Cheeseonpizza.visible == true:
					$Cookedcheesepiza.visible = true
				$Cheeseonpizza.visible = false
func _on_chopping_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = true
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	in_chopping = true
	update_area()

func _on_mixing_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = true
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	in_mixing = true
	update_area()

func _on_pizza_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = true
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	in_pizza = true
	update_area()

func _on_coffe_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = true
	$packing/packe.visible = false
	in_coffee = true
	update_area()
func _on_packing_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = true
	in_packing = true
	update_area()
func _on_chopping_body_exited(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$Node2D.SPEED = 150
	in_chopping = false
	update_area()
func _on_mixing_body_exited(body: Node2D) -> void:
	$mixing/Mixe.visible = false
	$Node2D.SPEED = 150
	in_mixing = false
	update_area()
func _on_pizza_body_exited(body: Node2D) -> void:
	$pizza/pizzae.visible = false
	$Node2D.SPEED = 150
	in_pizza = false
	update_area()
func _on_coffe_body_exited(body: Node2D) -> void:
	$coffe/coffee.visible = false
	$Node2D.SPEED = 150
	in_coffee = false
	update_area()
func _on_packing_body_exited(body: Node2D) -> void:
	$packing/packe.visible = false
	$Node2D.SPEED = 150
	in_packing = false
	update_area()
func _on_bake_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	$bake/bakee.visible = true
	in_bake = true
	update_area()
func _on_bake_body_exited(body: Node2D) -> void:
	$bake/bakee.visible = false
	in_bake = false
	update_area()
