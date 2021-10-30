tool
extends TileSet

# special thanks to https://www.reddit.com/r/godot/comments/ebo4o9/making_two_autotiles_merge/
# and https://godotforums.org/discussion/22076/merge-2-autotiles

const GROUND = 0
const DEATH_TILE = 1
const PLACEHOLDER = 2
const GROUND2 = 3

var binds = {
	GROUND: [DEATH_TILE, PLACEHOLDER, GROUND2],
	GROUND2: [GROUND]
}

func _is_tile_bound(drawn_id, neighbor_id):
	print("Ayo wtf")
	if drawn_id in binds:
		return neighbor_id in binds[drawn_id]
	return false
