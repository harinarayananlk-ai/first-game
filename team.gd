extends Node2D

var turnteam1 = false
var turnteam2 = false

@export var teamid: int

signal team_turn_finished
signal team_not_moving
signal team_moving

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player1.turn_finished.connect(_on_turn_finished)

func _on_turn_finished():
	team_turn_finished.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if get_parent().current_player == 1:
		turnteam1 = true
		turnteam2 = false
	elif get_parent().current_player == 2:
		turnteam2 = true
		turnteam1 = false
	else:
		turnteam1 = false
		turnteam2 = false
	if $Player1.linear_velocity.length() < 150:
		team_not_moving.emit()
	else:
		team_moving.emit()
