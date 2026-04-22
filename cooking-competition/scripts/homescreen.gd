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
					$Banner/pizza.text = "Get Pizza"
				else:
					$Banner/pizza.text = "Cook Pizza"
			if not $Smoothie.visible:
				if not $FruitSmoothie.visible:
					$Banner/smoothie.text = "Chop Vegetables"
				else:
					$Banner/smoothie.text = "Mix Vegetables"
			if not $Coffe.visible:
				$Banner/coffe.text = "Brew Coffe"
			
			if 	$Cookedpizza.visible and $Coffe.visible and $Smoothie.visible:
				$Banner/pizza.text = ""
				$Banner/coffe.text = ""
				$Banner/smoothieprint.text = "Completed"
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
	area = 1

func _on_mixing_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = true
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	area = 2

func _on_pizza_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = true
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	area = 3

func _on_coffe_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = true
	$packing/packe.visible = false
	area = 4
func _on_packing_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = true
	area = 5
func _on_chopping_body_exited(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$Node2D.SPEED = 150
	area = 0
func _on_mixing_body_exited(body: Node2D) -> void:
	$mixing/Mixe.visible = false
	$Node2D.SPEED = 150
	area = 0
func _on_pizza_body_exited(body: Node2D) -> void:
	$pizza/pizzae.visible = false
	$Node2D.SPEED = 150
	area = 0
func _on_coffe_body_exited(body: Node2D) -> void:
	$coffe/coffee.visible = false
	$Node2D.SPEED = 150
	area = 0
func _on_packing_body_exited(body: Node2D) -> void:
	$packing/packe.visible = false
	$Node2D.SPEED = 150
	area = 0
func _on_bake_body_entered(body: Node2D) -> void:
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	$bake/bakee.visible = true
	area = 0
func _on_bake_body_exited(body: Node2D) -> void:
	$bake/bakee.visible = false
	area = 0
