extends CollisionShape2D


export(Array, NodePath) onready var copy_these_paths
onready var copy_these = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for path in copy_these_paths:
		copy_these.append(get_node(path))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	self.disabled = true
	for collider in copy_these:
		if not collider.disabled:
			self.shape = collider.shape
			self.disabled = collider.disabled

