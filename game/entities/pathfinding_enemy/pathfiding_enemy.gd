extends CharacterBody2D

@onready var speed: float = 1

var tilemap: TileMap
var target: CharacterBody2D
var current_path: Array[Vector2i]

func _physics_process(_delta):
	set_path()
	if current_path.is_empty():
		return
	
	
	
	var target_position = tilemap.map_to_local(current_path.front())
	global_position = global_position.move_toward(target_position, speed)
	
	if global_position == target_position:
		current_path.pop_front()
		
func set_path():
	current_path = tilemap.astargrid.get_id_path(
		tilemap.local_to_map(global_position),
		tilemap.local_to_map(target.global_position)
	).slice(1)
