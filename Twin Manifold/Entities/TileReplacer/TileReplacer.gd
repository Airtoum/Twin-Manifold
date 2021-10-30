extends Node2D

export(NodePath) var tilemap_path # direct reference but this entity doesn't really 
								  # mean anything without a tileset to act on
onready var tilemap = get_node(tilemap_path) as TileMap
export(NodePath) var my_activator
export(int) var new_tile;
var old_tile
# TileReplacer always acts upon the tile it's on, these stretch the boundary extra
export(int) var tiles_up
export(int) var tiles_right
export(int) var tiles_left
export(int) var tiles_down


# Called when the node enters the scene tree for the first time.
func _ready():
	old_tile = tilemap.get_cellv(tilemap.world_to_map(self.position))
	GameEvents.connect("activate", self, "activate")
	GameEvents.connect("deactivate", self, "deactivate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func set_my_tiles(to_what):
	var grid_offset = Vector2(tiles_left, tiles_up)
	for x in range(tiles_left + 1 + tiles_right):
		for y in range(tiles_up + 1 + tiles_down):
			grid_offset = Vector2(tiles_left + x, tiles_up + y)
			var grid_pos = tilemap.world_to_map(self.position) + grid_offset
			tilemap.set_cellv(grid_pos, to_what)
			tilemap.update_bitmask_area(grid_pos)

func activate(activator : Node):
	if (activator == get_node_or_null(my_activator)):
		set_my_tiles(new_tile)
	
func deactivate(activator : Node):
	if (activator == get_node_or_null(my_activator)):
		set_my_tiles(old_tile)
