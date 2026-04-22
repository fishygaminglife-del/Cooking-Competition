extends Control

var veg_index = 0
var vegetables = [
	"carrot",
    "tomato"
]

func _ready() -> void:
	load_vegetable(vegetables[veg_index])
func _process(delta: float) -> void:
	if visible:
		$Knife.position = get_local_mouse_position()

func _input(event):
	if not visible:
		return

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		cut_current_vegetable()

func load_vegetable(veg_name):
	if veg_name == "carrot":
		$Ingredient.texture = preload("res://assets/pickle.png")

	elif veg_name == "tomato":
		$Ingredient.texture = preload("res://assets/arrot.png")

func cut_current_vegetable():
	if veg_index >= vegetables.size():
		return
	if $"../FruitSmoothie".visible or $"../Smoothie".visible:
		return
	
	var veg_name = vegetables[veg_index]

	# show chopped version
	if veg_name == "carrot":
		$Ingredient.texture = preload("res://assets/cutupfood.png")

	elif veg_name == "tomato":
		$Ingredient.texture = preload("res://assets/cutupfood2.png")

	# wait 0.5 seconds
	await get_tree().create_timer(0.5).timeout

	# move to next vegetable
	veg_index += 1

	# if more vegetables exist → load next raw vegetable
	if veg_index < vegetables.size():
		load_vegetable(vegetables[veg_index])
	else:
		# done → close UI
		veg_index = 0
		load_vegetable(vegetables[veg_index])
		$"../FruitSmoothie".visible = true
		$"../Panel".visible = false
		$"../Node2D".SPEED = 150
		visible = false
