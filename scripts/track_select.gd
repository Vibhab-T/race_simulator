extends Control

@onready var track: Button = $Track
@onready var next: Button = $Next
@onready var previous: Button = $Previous
@onready var back: Button = $Back

var selected_track = 1

func _on_track_pressed() -> void:
	Global.track = selected_track
	get_tree().change_scene_to_file("res://scenes/race_setup_scene.tscn")

func _on_next_pressed() -> void:
	selected_track += 1
	track.text = "Track " + str(selected_track)


func _on_previous_pressed() -> void:
	if selected_track != 1:
		selected_track -= 1
		track.text = "Track " + str(selected_track)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
