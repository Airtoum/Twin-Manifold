extends Control


export(NodePath) var player


# Called when the node enters the scene tree for the first time.
func _ready():
	$Icon/Counter.target = get_node_or_null(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
