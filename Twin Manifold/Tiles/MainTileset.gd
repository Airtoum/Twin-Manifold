tool
extends TileSet

# special thanks to https://www.reddit.com/r/godot/comments/ebo4o9/making_two_autotiles_merge/
# and https://godotforums.org/discussion/22076/merge-2-autotiles

const PIPES = 0
const TILE = 1
const VOID = 2
const DOOR1 = 3
const BEIGE = 4
const PIPE_DECOR = 5
const DOOR2 = 6
const DOOR3 = 7
const DOOR1_DARK = 8
const DOOR2_DARK = 9
const DOOR3_DARK = 10

var binds = {
	PIPES: [TILE, BEIGE, PIPE_DECOR],
	TILE: [DOOR1, BEIGE],
	PIPE_DECOR: [TILE, BEIGE, PIPES]
}

func _is_tile_bound(drawn_id, neighbor_id):
	if drawn_id in binds:
		return neighbor_id in binds[drawn_id]
	return false
