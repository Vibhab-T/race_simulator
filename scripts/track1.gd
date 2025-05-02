extends Node

@onready var start_finish: Area2D = $"../StartFinish"
@onready var startings: Node = $"."
@onready var track_1: Node2D = $"../.."
@onready var start_race_bttton: Button = $"../../Control/StartRaceBttton"
var car_scene = preload("res://scenes/car.tscn")

var spawned = 0
var spawn_offset = 0.001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_cars(Global.current_race_settings.grid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_cars(grid: Grid):
	for start_pos in startings.get_children():
		var path = start_pos.get_node("PathFollow2D")
		path.progress_ratio = spawn_offset
		spawn_offset -= 0.005
		
		if path and car_scene:
			var car_instance = car_scene.instantiate()
			path.add_child(car_instance)
			car_instance.setup(grid.position[spawned])
			spawned += 1



func _on_start_race_bttton_pressed() -> void:
	Global.race_started = true
	track_1.get_node("Control").remove_child(start_race_bttton)
