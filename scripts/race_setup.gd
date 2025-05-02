extends Control

@onready var position_start: Label = $PositionStart
@onready var tyre_start: Label = $TyreStart

var start_position = 1
var start_tyre = 1
const tyres = {
	1: "S",
	2: "M",
	3: "H"
}

func _on_race_pressed() -> void:
	Global.save_race_settings(start_position, tyres[start_tyre])
	get_tree().change_scene_to_file(Global.tracks[Global.track])

func _on_pos_down_pressed() -> void:
	if start_position > 1 :
		start_position -= 1
		position_start.text = str(start_position)

func _on_pos_up_pressed() -> void:
	if start_position < 20 :
		start_position += 1
		position_start.text = str(start_position)

func _on_tyre_down_pressed() -> void:
	if start_tyre > 1:
		start_tyre -= 1
		tyre_start.text = tyres[start_tyre]

func _on_tyre_up_pressed() -> void:
	if start_tyre < 3:
		start_tyre += 1
		tyre_start.text = tyres[start_tyre]
