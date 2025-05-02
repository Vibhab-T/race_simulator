class_name Team extends Resource

var name: String
var color: Color
var id: String

const team_dict = {
		"A": {"name": "Alpha Racing", "color": Color.RED, "primary_driver": "a", "secondary_driver": "k"},
		"B": {"name": "Bravo Motorsport", "color": Color.BLUE, "primary_driver": "b", "secondary_driver": "l"},
		"C": {"name": "Charlie Performance", "color": Color.GREEN, "primary_driver": "c", "secondary_driver": "m"},
		"D": {"name": "Delta Engineering", "color": Color.YELLOW, "primary_driver": "d", "secondary_driver": "n"},
		"E": {"name": "Echo Grand Prix", "color": Color.ORANGE, "primary_driver": "e", "secondary_driver": "o"},
		"F": {"name": "Foxtrot Dynamics", "color": Color.PURPLE, "primary_driver": "f", "secondary_driver": "p"},
		"G": {"name": "Golf Racing Team", "color": Color.PINK, "primary_driver": "g", "secondary_driver": "q"},
		"H": {"name": "Hotel Motors", "color": Color.CYAN, "primary_driver": "h", "secondary_driver": "r"},
		"I": {"name": "India Speed", "color": Color.LIME, "primary_driver": "i", "secondary_driver": "s"},
		"J" : {"name": "Juliet Racing", "color": Color.MAROON, "primary_driver": "j", "secondary_driver": "t"}
	}

static func get_team_data() -> Dictionary:
	return team_dict

static func get_team_by_id(id: String) -> Team:
	var return_team: Team = Team.new()
	return_team.id = id
	return_team.name = team_dict[id]["name"]
	return_team.color = team_dict[id]["color"]
	return return_team
	
