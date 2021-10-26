extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("collided_with", self, "_on_collided_with")


func _on_collided_with(who, whom, coll: KinematicCollision2D):
	if whom == self:
		# test at 4 different points if collision happens to be on tile edge/corner
		for dx in [-0.5, 0.5]:
			for dy in [-0.5, 0.5]:
				evaluate_collision(coll.position + Vector2(dx, dy), who, coll)
		
func evaluate_collision(world_position, who, coll):
	var grid_pos = self.world_to_map(world_position)
	if get_cellv(grid_pos) == 1:
		who.die()
