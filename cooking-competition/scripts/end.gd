extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.text = str(Global.orders)
	$Label3.text = str(Global.time) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")
