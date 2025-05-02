extends Node

var all_teams: Dictionary
var all_drivers: Dictionary
var team_driver_map: Dictionary
var current_race_settings : RaceSettings = RaceSettings.new()
var track: int
var race_started = false

const tracks = {
	1: "res://scenes/track_1.tscn"
}

func _ready() -> void:
	init_teams()
	
func init_teams():
	all_teams = Team.get_team_data()
	all_drivers = Driver.get_driver_data()
	
	team_driver_map = {}
	for team_id in all_teams:
		var team_data = all_teams[team_id]
		team_driver_map[team_id] = {
			"team_name": team_data["name"],
			"color": team_data["color"],
			"drivers": [
				team_data["primary_driver"],
				team_data["secondary_driver"]
			]
		}

func save_race_settings(start_position: int, start_tyres: String):
	
	current_race_settings.player_start_pos = start_position
	current_race_settings.player_start_tyre = start_tyres
	current_race_settings.track = tracks[track]

	var cars : Array[Car] = []
	
	for id in all_drivers:
		var teamId = all_drivers[id]["team"]
		var driverId = id
		var car = generate_car(teamId, driverId)
		cars.append(car)
	
	print(cars)
	
	current_race_settings.grid = generate_grid(cars)

func generate_grid(cars: Array[Car]):
	var return_grid: Grid = Grid.new()
	return_grid.position = cars
	return_grid.position.shuffle()
	return return_grid
 

func generate_car(teamId: String, driverId: String):
	var return_car: Car = Car.new()
	var tyre_choice = ["S", "M", "H"]
	var base_speed = 300
	var tyre_modifires ={"S": 1.100, "M": 1.010, "H": 1.001}
	return_car.driver = Driver.get_driver_by_id(driverId)
	return_car.team = Team.get_team_by_id(teamId)
	return_car.tyre = tyre_choice[randi_range(0,2)]
	return_car.speed = base_speed * tyre_modifires[return_car.tyre] * (return_car.driver.overall/100)
	return return_car
	
