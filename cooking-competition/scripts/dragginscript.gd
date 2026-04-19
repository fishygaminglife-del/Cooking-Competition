extends TextureRect

@export var topping_type := "cheese"

var dragging = false
var drag_offset = Vector2.ZERO

@onready var pizza = get_tree().get_first_node_in_group("pizza")

func _ready():
	add_to_group("topping_icon")

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			dragging = true
			drag_offset = global_position - get_global_mouse_position()
		else:
			dragging = false
			check_drop()

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + drag_offset


func check_drop():
	if pizza == null:
		print("NO PIZZA FOUND")
		return

	print("CHECK DROP")

	# SIMPLE UI HIT TEST
	if pizza.get_global_rect().has_point(get_global_mouse_position()):
		print("HIT PIZZA:", topping_type)
		pizza.add_topping(topping_type)
	else:
		print("MISSED")
