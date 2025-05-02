extends Node2D



@onready var label: Label =  $Label
var speed: float
var path_follow: PathFollow2D
var color: Color


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	path_follow = get_parent() as PathFollow2D
	queue_redraw()

func _draw() -> void:
	draw_circle(Vector2.ZERO, 10, color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if path_follow and Global.race_started:
		path_follow.progress += speed * delta

func setup(car_data: Car):
	color = car_data.team.color
	label.text = car_data.driver.id
	label.position = Vector2(-5, -10)
	speed = car_data.speed
