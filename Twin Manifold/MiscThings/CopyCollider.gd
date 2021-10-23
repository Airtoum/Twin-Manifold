extends CollisionShape2D


export(NodePath) onready var copy_this = get_node(copy_this) as CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	self.shape = copy_this.shape
	self.disabled = copy_this.disabled
