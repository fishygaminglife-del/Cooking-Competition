extends Node2D

var orders = 0
var area = 0
var time = 0.0
func _ready() -> void:
	orders = 0
	time = 0.0
	
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
func _process(delta: float) -> void:
	time += delta

func _input(event):
	if event.is_action_pressed("interact"):
		print(area)
		if area == 1:
			if not $FruitSmoothie.visible and not $Smoothie.visible:
				$Node2D.SPEED = 0
				$Panel.visible = true
				$CuttingUI.visible = true
				$chopping/Chope.visible = false
		elif area == 2:
			if $FruitSmoothie.visible == true:
				$mixing/Mixe.visible = false
				$FruitSmoothie.visible = false
				await get_tree().create_timer(0.5).timeout
				$Smoothie.visible = true
			elif $Smoothie.visible:
				print("Already have")
			else:
				print("Cut Vegetables")
		elif area == 3:
			if not $Pizza.visible and not $Cookedpizza.visible:
				$Node2D.SPEED = 0
				$Panel.visible = true
				$PizzaBase.visible = true
				$pizza/pizzae.visible = false
		elif area == 4:
			$audio/coffemake.play()
			$coffe/coffee.visible = false
			await get_tree().create_timer(0.4).timeout
			$Coffe.visible = true
			$audio/coffemake.stream_paused = true
		elif area == 5:
			if not $Cookedpizza.visible:
				if not $Pizza.visible:
					$pizza2.text = "Get Pizza"
				else:
					$pizza2.text = "Cook Pizza"
			if not $Smoothie.visible:
				if not $FruitSmoothie.visible:
					$smoothie2.text = "Chop Vegetables"
				else:
					$smoothie2.text = "Mix Vegetables"
			if not $Coffe.visible:
				$coffe2.text = "Brew Coffe"
			
			if 	$Cookedpizza.visible and $Coffe.visible and $Smoothie.visible:
				$pizza2.text = ""
				$coffe2.text = ""
				$smoothie2.text = "Completed"
				$PackedOrder.visible = true
				$Cookedpizza.visible = false
				$Cookedcheesepiza.visible = false
				$Oniononpizza.visible = false
				$Peperoniaonpizza.visible = false
				$Smoothie.visible = false
				$Coffe.visible = false
				orders += 1
			$AnimationPlayer.play("banner_move")
		elif area == 6:
			if $Pizza.visible == true:
				$bake/bakee.visible = false
				await get_tree().create_timer(0.3).timeout
				$Pizza.visible = false
				$Cookedpizza.visible = true
				if $Cheeseonpizza.visible == true:
					$Cookedcheesepiza.visible = true
				$Cheeseonpizza.visible = false
		elif area == 7:
			if $PackedOrder.visible:
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
					get_tree().change_scene_to_file("res://scenes/home.tscn")
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
