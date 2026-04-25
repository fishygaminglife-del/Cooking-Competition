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
	$ordering.visible = false
	npc_order()
	$ordering.visible = false
	$smoothie2.text = 'Press "E" at different stations to ineract!'
	$AnimatedSprite2D.play("default")
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
	$ordering/Cookedpizza.visible = false
	$ordering/Cookedcheesepiza.visible = false
	$ordering/Oniononpizza.visible = false
	$ordering/Peperoniaonpizza.visible = false
	$ordering/Smoothie.visible = false
	$ordering/Coffe.visible = false
	if rand_drink == 0 and rand_coff == 0 and rand_pizza == 0:
		random()
	elif rand_drink == 1:
		$ordering/Smoothie.visible = true
	elif rand_drink == 0:
		$ordering/Smoothie.visible = false
	if rand_coff == 1:
		$ordering/Coffe.visible = true
	elif rand_coff == 0:
		$ordering/Coffe.visible = false
	if rand_pizza == 1:
		$ordering/Cookedpizza.visible = true
		if rand_peperoni == 1:
			$ordering/Peperoniaonpizza.visible = true
		elif rand_peperoni == 0:
			$ordering/Peperoniaonpizza.visible = false
		if rand_onion == 1:
			$ordering/Oniononpizza.visible = true
		elif rand_onion == 0:
			$ordering/Oniononpizza.visible = false
		if rand_cheese == 1:
			$ordering/Cookedcheesepiza.visible = true
		elif rand_cheese == 0:
			$ordering/Cookedcheesepiza.visible = false
	elif rand_pizza == 0:
		$ordering/Cookedpizza.visible = false
func npc_order():
	var npc_num = 0
	if npc_num == 0:
		$AnimationPlayer2.play("npc walk")
		await $AnimationPlayer2.animation_finished
		$ordering.visible = true
		random()

		npc_num = 1
	elif npc_num == 1:
		$AnimatedSprite2D.modulate = Color(0.585, 0.321, 0.183, 1.0)
		$AnimationPlayer2.play("npc walk")
		await $AnimationPlayer2.animation_finished
		$ordering.visible = true
		random()
		npc_num = 0
func check_randi():
	if rand_drink == 1:
		if 	$Smoothie.visible == true:
			drink = true
		else:
			drink = false	
	elif rand_drink == 0:
		if 	$Smoothie.visible == true:
			drink = false
		else:
			drink = true
	print(drink)
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
	print(coffe)
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
		else:
			pizza = true
			onion = true
			cheese = true
			peperonia = true
	print(pizza)
	print(peperonia)
	print(cheese)
	print(onion)
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
				$PizzaBase.cheese = 0
				$PizzaBase.perperoni = 0
				$PizzaBase.onion = 0
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
			check_randi()	
			$PackedOrder.visible = true
			$Cookedpizza.visible = false
			$Cookedcheesepiza.visible = false
			$Oniononpizza.visible = false
			$Peperoniaonpizza.visible = false
			$Smoothie.visible = false
			$Coffe.visible = false
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
				$ordering.visible = false
				$ordering/Cookedpizza.visible = false
				$ordering/Cookedcheesepiza.visible = false
				$ordering/Oniononpizza.visible = false
				$ordering/Peperoniaonpizza.visible = false
				$ordering/Smoothie.visible = false
				$ordering/Coffe.visible = false
				$AnimationPlayer2.play("npc_exit")
				await $AnimationPlayer2.animation_finished
				npc_order()
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
				$ordering.visible = false
				$ordering/Cookedpizza.visible = false
				$ordering/Cookedcheesepiza.visible = false
				$ordering/Oniononpizza.visible = false
				$ordering/Peperoniaonpizza.visible = false
				$ordering/Smoothie.visible = false
				$ordering/Coffe.visible = false
				$AnimationPlayer2.play("npc_exit")
				await $AnimationPlayer2.animation_finished
				npc_order()
				print("all bad")
			$PackedOrder.visible = false
			
		elif area == 8:
			Global.time = time
			Global.orders = orders
			get_tree().change_scene_to_file("res://scenes/end.tscn")
		elif area == 9:
			$Trashcan.visible = true
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





func _on_trash_body_entered(body: Node2D) -> void:
	area = 9
	$trash/trashe.visible = true

func _on_trash_body_exited(body: Node2D) -> void:
	area = 0
	$Trashcan.visible = false
	$trash/trashe.visible = false

func _on_button_pressed() -> void:
	$Pizza.visible = false
	$Cheeseonpizza.visible = false
	$Cookedpizza.visible = false
	$Cookedcheesepiza.visible = false
	$Peperoniaonpizza.visible = false
	$Oniononpizza.visible = false


func _on_button_2_pressed() -> void:
	$Coffe.visible = false


func _on_button_3_pressed() -> void:
	$Smoothie.visible = false
	$FruitSmoothie.visible = false


func _on_button_4_pressed() -> void:
	$PackedOrder.visible = false
