extends Control

const SAVE_PATH = "user://save.cfg"
const TEST_SAVE_PATH = "res://save.cfg"

var save_path = SAVE_PATH

@onready var score_value = $CenterContainer/VBoxContainer/HBoxContainer/RoomsScoreValue
@onready var high_score_value = $CenterContainer/VBoxContainer/HBoxContainer2/HighRoomsScoreValue

func _ready() -> void:
	load_highscore()
	if Globals.rooms_explored > Globals.highscore:
		Globals.highscore = Globals.rooms_explored
		save_highsocre()
	score_value.text = str(Globals.rooms_explored)
	high_score_value.text = str(Globals.highscore)
	Globals.reset_globals()

func load_highscore() -> void:
	var config = ConfigFile.new()
	var error = config.load(TEST_SAVE_PATH)
	if error != OK: return
	Globals.highscore = config.get_value("game", "highscore")

func save_highsocre() -> void:
	var config = ConfigFile.new()
	config.set_value("game", "highscore", Globals.highscore)
	config.save(TEST_SAVE_PATH)
