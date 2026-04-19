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
