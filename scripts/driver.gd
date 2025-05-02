class_name Driver extends Resource

var name: String 
var overall: float
var team: Team
var id: String

const driver_dict = {
		"a": {"name": "Alex Archer", "overall": 90, "team": "A"},
		"b": {"name": "Blake Brooks", "overall": 90,  "team": "B"},
		"c": {"name": "Casey Cole", "overall": 90, "team": "C"},
		"d": {"name": "Dakota Dale", "overall": 90,  "team": "D"},
		"e": {"name": "Emerson Ellis", "overall": 90, "team": "E"},
		"f": {"name": "Finley Fox", "overall": 90,  "team": "F"},
		"g": {"name": "Greyson Gale", "overall": 90, "team": "G"},
		"h": {"name": "Hayden Hayes", "overall": 90, "team": "H"},
		"i": {"name": "Jordan Jules", "overall": 90, "team": "I"},
		"j": {"name": "Kai Kingsley", "overall": 90,"team": "J"},
		"k": {"name": "Logan Lane", "overall": 90,  "team": "A"},
		"l": {"name": "Morgan Moss", "overall": 90, "team": "B"},
		"m": {"name": "Nolan Nash", "overall": 90, "team": "C"},
		"n": {"name": "Oakley Owen", "overall": 90, "team": "D"},
		"o": {"name": "Peyton Pierce", "overall": 90,  "team": "E"},
		"p": {"name": "Quinn Quick", "overall": 90,  "team": "F"},
		"q": {"name": "Riley Rhodes", "overall": 90, "team": "G"},
		"r": {"name": "Sawyer Stone", "overall": 90,  "team": "H"},
		"s": {"name": "Taylor True", "overall": 90,  "team": "I"},
		"t": {"name": "Uriel Underwood", "overall": 90,  "team": "J"}
	}

static func get_driver_data() -> Dictionary:
	return driver_dict
	
static func get_driver_by_id(id: String) -> Driver:
	var return_driver: Driver = Driver.new()
	return_driver.id = str(id)
	return_driver.name = driver_dict[id]["name"]
	return_driver.overall = driver_dict[id]["overall"]
	return_driver.team = Team.get_team_by_id(driver_dict[id]["team"])
	return return_driver
