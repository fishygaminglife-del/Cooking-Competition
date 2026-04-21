extends TextureRect

func _ready():
	add_to_group("pizza")
	print("Pizza ready")

func add_topping(type):
	print("ADDING TOPPING:", type)

	if type == "cheese":
		$CheeseImage.visible = true
		$ToppingsTray/CheeseIcon.visible = false
	elif type == "peperoni":
		$PeperoniImage.visible = true
		$ToppingsTray/PeperoniIcon.visible = false
	elif type == "onion":
		$OnionImage.visible = true
		$ToppingsTray/OnionIcon.visible = false


func _on_pizza_exit_pressed() -> void:
	$"../Node2D".SPEED = 150
	$"../Cheeseonpizza".visible = true
	$".".visible = false
	$CheeseImage.visible = false
	$PeperoniImage.visible = false
	$OnionImage.visible = false
	$"../Panel".visible = false
	$ToppingsTray/PeperoniIcon.visible = true
	$ToppingsTray/CheeseIcon.visible = true
	$ToppingsTray/OnionIcon.visible = true
	$ToppingsTray/PeperoniIcon.position = Vector2(-133, 160)
	$ToppingsTray/CheeseIcon.position = Vector2(-138, 92)
	$ToppingsTray/OnionIcon.position = Vector2(-132, 38)
