extends Label


export(String, MULTILINE) var property


# Called when the node enters the scene tree for the first time.
func _ready():
	property = NodePath(property)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(get_node(property).get_indexed(property.get_concatenated_subnames()))
