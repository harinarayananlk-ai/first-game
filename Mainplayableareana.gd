extends Node2D

var current_player = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Team1/Player1.position = Vector2(900,0)
	$Team2/Player1.position = Vector2(-900,0)
	print(current_player)
	print("hello_world")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
