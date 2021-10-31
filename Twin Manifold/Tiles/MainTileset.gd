tool
extends TileSet

# special thanks to https://www.reddit.com/r/godot/comments/ebo4o9/making_two_autotiles_merge/
# and https://godotforums.org/discussion/22076/merge-2-autotiles

const PIPES = 0
const TILE = 1
const VOID = 2
const DOOR1 = 3

var binds = {
	PIPES: [TILE, DOOR1],
	TILE: [DOOR1]
}

func _is_tile_bound(drawn_id, neighbor_id):
	if drawn_id in binds:
		return neighbor_id in binds[drawn_id]
	return false
