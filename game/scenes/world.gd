extends Node2D

const PLAYER = preload("res://game/entities/player/player.tscn")
const EXIT = preload("res://game/entities/level_exit/exit.tscn")
const PATHFIDING_ENEMY = preload("res://game/entities/pathfinding_enemy/pathfiding_enemy.tscn")

var borders = Rect2(1, 1, 28, 21)

@onready var tile_map = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generate_level()

func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(200)
	
	var player = PLAYER.instantiate()
	add_child(player)
	player.position = map.front() * 32
	
	var exit = EXIT.instantiate()
	add_child(exit)
	exit.position = walker.get_end_room().position * 32
	exit.connect("leaving_level", Callable(self, "reload_level"))
	
	var pathfinding_enemy = PATHFIDING_ENEMY.instantiate()
	pathfinding_enemy.tilemap = tile_map
	pathfinding_enemy.target = player
	add_child(pathfinding_enemy)
	pathfinding_enemy.position = walker.get_end_room().position * 32
	
	walker.queue_free()
	var cells = []
	for location in map:
		cells.append(location)
	tile_map.set_cells_terrain_connect(0, cells, 0, -1)
	tile_map.create_grid()


func reload_level():
	get_tree().reload_current_scene()
