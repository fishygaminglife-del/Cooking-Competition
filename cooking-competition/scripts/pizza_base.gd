extends TextureRect
var cheese = 0
var onion = 0
var perperoni = 0

func _ready():
	cheese = 0
	onion = 0
	perperoni = 0
	add_to_group("pizza")
	print("Pizza ready")

func add_topping(type):
	print("ADDING TOPPING:", type)

	if type == "cheese":
		$CheeseImage.visible = true
		$ToppingsTray/CheeseIcon.visible = false
		cheese = 1
	elif type == "peperoni":
		$PeperoniImage.visible = true
		$ToppingsTray/PeperoniIcon.visible = false
		perperoni = 1
	elif type == "onion":
		$OnionImage.visible = true
		$ToppingsTray/OnionIcon.visible = false
		onion = 1


func _on_pizza_exit_pressed() -> void:
	$"../UIINSTRUCTIONS".visible = false
	$"../Pizza".visible = false
	$"../Cheeseonpizza".visible = false
	$"../Peperoniaonpizza".visible = false
	$"../Oniononpizza".visible = false
	if cheese == 1:
		$"../Cheeseonpizza".visible = true
	if perperoni == 1:
		$"../Peperoniaonpizza".visible = true
	if onion == 1:
		$"../Oniononpizza".visible = true
	$"../Node2D".SPEED = 150
	$"../Pizza".visible = true
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
