extends Node2D
var rand_drink = 0
var rand_coff = 0
var rand_pizza = 0
var	rand_peperoni = 0
var	rand_onion = 0
var	rand_cheese = 0
var drink = false
var coffe = false
var pizza = false
var peperonia = false
var cheese = false
var onion = false
var orders = 0
var area = 0
var time = 0
func _ready() -> void:
	orders = 0
	time = 0
	random()
	$smoothie2.text = 'Press "E" at different stations to ineract!'
	$AnimationPlayer.play("banner_move")
	$CuttingUI.visible = false
	$bake/bakee.visible = false 
	$chopping/Chope.visible = false
	$mixing/Mixe.visible = false
	$pizza/pizzae.visible = false
	$coffe/coffee.visible = false
	$packing/packe.visible = false
	$PizzaBase.visible = false
	$Panel.visible = false
	$Coffe.visible = false
	$Cheeseonpizza.visible = false
	area = 0
func _process(delta) -> void:
	time += delta
func random():
	rand_drink = randi_range(0,1)
	rand_coff = randi_range(0,1)
	rand_pizza = randi_range(0,1)
	rand_onion = randi_range(0,1)
	rand_peperoni = randi_range(0,1)
	rand_cheese = randi_range(0,1)
	if rand_drink == 1:
		print(rand_drink)
	elif rand_drink == 0:
		print(rand_drink)
	if rand_coff == 1:
		print(rand_coff)
	elif rand_coff == 0:
		print(rand_coff)
	if rand_pizza == 1:
		print(rand_pizza)
	elif rand_pizza == 0:
		print(rand_pizza)
	if rand_peperoni == 1:
		print(rand_peperoni)
	elif rand_peperoni == 0:
		print(rand_peperoni)
	if rand_onion == 1:
		print(rand_onion)
	elif rand_onion == 0:
		print(rand_onion)
	if rand_cheese == 1:
		print(rand_cheese)
	elif rand_cheese == 0:
		print(rand_cheese)
func check_randi():
	if rand_drink == 1:
		if 	$FruitSmoothie.visible == true:
			drink = true
		else:
			drink = false
	elif rand_drink == 0:
		if 	$FruitSmoothie.visible == true:
			drink = false
		else:
			drink = true
	if rand_coff == 1:
		if 	$Coffe.visible == true:
			coffe = true
		else:
			coffe = false
	elif rand_coff == 0:
		if 	$Coffe.visible == true:
			coffe = false
		else:
			coffe = true	
	if rand_pizza == 1:
		if 	$Cookedpizza.visible == true:
			pizza = true
			if rand_peperoni == 1:
				if $Peperoniaonpizza.visible == true:
					peperonia = true
				else:
					peperonia = false
			elif rand_peperoni == 0:
				if $Peperoniaonpizza.visible == true:
					peperonia = false
				else:
					peperonia = true
			if rand_cheese == 1:
				if $Cookedcheesepiza.visible == true:
					cheese = true
				else:
					cheese = false
			elif rand_cheese == 0:
				if $Cookedcheesepiza.visible == true:
					cheese = false
				else:
					cheese = true
			if rand_onion == 1:
				if $Oniononpizza.visible == true:
					onion = true
				else:
					onion = false
			elif rand_onion == 0:
				if $Oniononpizza.visible == true:
					onion = false
				else:
					onion = true
		else:
			pizza = false
		
	elif rand_pizza == 0:
		if 	$Cookedpizza.visible == true:
			pizza = false
	if drink and coffe and pizza and onion and peperonia and cheese:
		print("all good")
func _input(event):
	if event.is_action_pressed("interact"):
		#print(area)
		if area == 1:
			if not $FruitSmoothie.visible and not $Smoothie.visible:
				$Node2D.SPEED = 0
				$Panel.visible = true
				$UIINSTRUCTIONS.text = 'Cut Vegetables by clicking them, after you are done blend it up for a drink.'
				$UIINSTRUCTIONS.visible = true
				$CuttingUI.visible = true
				$chopping/Chope.visible = false
		elif area == 2:
			if $FruitSmoothie.visible == true:
				$mixing/Mixe.visible = false
				$FruitSmoothie.visible = false
				$audio/Blender.play()
				await get_tree().create_timer(0.5).timeout
				$audio/Blender.stream_paused = true
				$Smoothie.visible = true
			elif $Smoothie.visible:
				print("Already have")
			else:
				print("Cut Vegetables")
		elif area == 3:
			if not $Pizza.visible and not $Cookedpizza.visible:
				$Node2D.SPEED = 0
				$Panel.visible = true
				$UIINSTRUCTIONS.text = 'Drag toppings onto the pizza, press the "X" to end (top right), bake pizza when done.'
				$UIINSTRUCTIONS.visible = true
				$PizzaBase.visible = true
				$pizza/pizzae.visible = false
		elif area == 4:
			$audio/coffemake.play()
			$coffe/coffee.visible = false
			await get_tree().create_timer(0.4).timeout
			$Coffe.visible = true
			$audio/coffemake.stream_paused = true
		elif area == 5:
			#$pizza2.text = ""
			#$smoothie2.text = ""
			#$coffe2.text = ""
			#if not $Cookedpizza.visible:
				#if not $Pizza.visible:
					#$pizza2.text = "Get Pizza"
				#else:
					#$pizza2.text = "Cook Pizza"
			#if not $Smoothie.visible:
				#if not $FruitSmoothie.visible:
					#$smoothie2.text = "Chop Vegetables"
				#else:
					#$smoothie2.text = "Mix Vegetables"
			#if not $Coffe.visible:
				#$coffe2.text = "Brew Coffe"
			#
			#if 	$Cookedpizza.visible and $Coffe.visible and $Smoothie.visible:
				#$pizza2.text = ""
				#$coffe2.text = ""
				#$smoothie2.text = "Completed"
				#$coffe2.text = "Send the order at the register, then make a new one!"
			check_randi()	
			$PackedOrder.visible = true
			$Cookedpizza.visible = false
			$Cookedcheesepiza.visible = false
			$Oniononpizza.visible = false
			$Peperoniaonpizza.visible = false
			$Smoothie.visible = false
			$Coffe.visible = false
			$AnimationPlayer.play("banner_move")
		elif area == 6:
			if $Pizza.visible == true:
				$bake/bakee.visible = false
				$audio/Bake.play()
				await get_tree().create_timer(0.3).timeout
				$audio/Bake.stream_paused = true
				$Pizza.visible = false
				$Cookedpizza.visible = true
				if $Cheeseonpizza.visible == true:
					$Cookedcheesepiza.visible = true
				$Cheeseonpizza.visible = false
		elif area == 7:
			if $PackedOrder.visible and drink and coffe and pizza and onion and peperonia and cheese:
				orders += 1
				if orders == 1:
					$Shelforder/Order.visible = true
				elif orders == 2:
					$Shelforder/Order2.visible = true
				elif orders == 3:
					$Shelforder/Order3.visible = true
				elif orders == 4:
					$Shelforder/Order4.visible = true
				elif orders == 5:
					$Shelforder/Order5.visible = true
				elif orders == 6:
					$Shelforder/Order6.visible = true
				elif orders == 7:
					$Shelforder/Order7.visible = true
				elif orders == 8:
					$Shelforder/Order8.visible = true
					$Banner/smoothie.text = "Yay, you beat Cooking Competition!"
					$AnimationPlayer.play("banner_move")
					await $AnimationPlayer.animation_finished
					get_tree().change_scene_to_file("res://scenes/end.tscn")
			else:
				print("all bad")
			$PackedOrder.visible = false
			
		elif area == 8:
			Global.time = time
			Global.orders = orders
			get_tree().change_scene_to_file("res://scenes/end.tscn")
func _on_chopping_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$mixing/Mixe.visible = false
		$pizza/pizzae.visible = false
		$coffe/coffee.visible = false
		$packing/packe.visible = false
		if not $FruitSmoothie.visible or not $Smoothie.visible:
			area = 1
			$chopping/Chope.visible = true
func _on_mixing_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$chopping/Chope.visible = false
		$pizza/pizzae.visible = false
		$coffe/coffee.visible = false
		$packing/packe.visible = false
		if $FruitSmoothie.visible:
			$mixing/Mixe.visible = true
			area = 2

func _on_pizza_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$chopping/Chope.visible = false
		$mixing/Mixe.visible = false
		$coffe/coffee.visible = false
		$packing/packe.visible = false
		if not $Pizza.visible or $Cookedpizza.visible:
			area = 3
			$pizza/pizzae.visible = true

func _on_coffe_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$chopping/Chope.visible = false
		$mixing/Mixe.visible = false
		$pizza/pizzae.visible = false
		$packing/packe.visible = false
		if not $Coffe.visible:
			$coffe/coffee.visible = true
			area = 4
func _on_packing_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
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
	if body.is_in_group("player"):
		$chopping/Chope.visible = false
		$mixing/Mixe.visible = false
		$pizza/pizzae.visible = false
		$coffe/coffee.visible = false
		$packing/packe.visible = false
		if $Pizza.visible:
			$bake/bakee.visible = true
			area = 6
func _on_bake_body_exited(body: Node2D) -> void:
	$bake/bakee.visible = false
	area = 0
func _on_shelveorder_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$shelveorder/shipee.visible = true
		area = 7
func _on_shelveorder_body_exited(body: Node2D) -> void:
	$shelveorder/shipee.visible = false
	area = 0
func _on_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		area = 8
func _on_end_body_exited(body: Node2D) -> void:
	area = 0
