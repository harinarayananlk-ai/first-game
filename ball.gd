extends RigidBody2D

const radius = 50

func _ready() -> void:
	queue_redraw()

func _draw():
	draw_circle(Vector2.ZERO, radius, Color.BROWN)

func _process(_delta: float) -> void:
	pass
