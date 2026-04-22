extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/homescreen.tscn")


func _on_inst_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_cred_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Credit.tscn")
