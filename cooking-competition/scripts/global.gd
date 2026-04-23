extends Sprite2D

var time:int
var orders
var volume: float = -10.0 
@onready var music = AudioStreamPlayer.new()

func _process(delta: float) -> void:
	music.volume_db = volume

func _ready():
	add_child(music)
	music.process_mode = Node.PROCESS_MODE_ALWAYS
	music.stream = preload("res://audio/bg music.mp3")
	music.stream.loop = true
	music.volume_db = volume
	music.play()
