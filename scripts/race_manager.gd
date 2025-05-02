extends Node


var cars: Array[Car] = []
var total_laps = 10
var race_positions: Array[Car] = []
var on_lap_changed = Signal()

func _ready() -> void:
	update_position()

func update_position():
	cars.sort_custom(func(a,b):
		if a.current_lap != b.current_lap:
			return a.current_lap > b.current_lap
		return a.total_progress > b.total_progress
	)
	race_positions = cars.duplicate()

func _process(delta: float) -> void:
	pass
