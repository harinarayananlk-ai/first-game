extends Node2D

var current_player = 1
var waiting = false
var movement = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Team1/Player1.position = Vector2(900,0)
	$Team2/Player1.position = Vector2(-900,0)
	$Ball.position = Vector2.ZERO
	for team in [$Team1, $Team2]:
		team.team_turn_finished.connect(_turn_switch)
		team.team_not_moving.connect(_turn_pls_switch)
		team.team_moving.connect(_turn_dont_switch)

func _turn_switch(): #after player is moved
	waiting = true

func _turn_dont_switch(): #when player is moving
	movement=true
	
func _turn_pls_switch(): #when player is done moving
	movement=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if waiting==true and movement==false:
		current_player = 3 - current_player
		print("Current player is -", current_player)
		movement=true
		waiting = false
