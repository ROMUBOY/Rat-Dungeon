extends TileMap
class_name Pathfind
var astargrid = AStarGrid2D.new()

# Called when the node enters the scene tree for the first time.
func create_grid():
	var tilemap_size = get_used_rect().end - get_used_rect().position
	var map_rect = Rect2i(Vector2i.ZERO, tilemap_size)
	
	var tile_size = get_tileset().tile_size
	
	astargrid.region = map_rect	
	astargrid.cell_size = tile_size
	astargrid.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astargrid.default_estimate_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	astargrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	astargrid.update()
	
	for x in tilemap_size.x:
		for y in tilemap_size.y:
			var coordinates = Vector2i(x, y)
			var tile_data = get_cell_tile_data(0, coordinates)
			if tile_data and tile_data.get_custom_data('Type') == 'wall':
				astargrid.set_point_solid(coordinates)
			
	
