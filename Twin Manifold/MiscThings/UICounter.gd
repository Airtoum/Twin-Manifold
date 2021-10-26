extends Label


export(String, MULTILINE) var prefix

export(NodePath) var target_path
onready var target = get_node(target_path)
export(String, MULTILINE) var property

export(String, MULTILINE) var suffix

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		var raw_property = target.get_indexed(property)
		var string = ""
		if raw_property == int(INF):
			string = "Infinity"
		else:
			string = str(raw_property)
		self.text = prefix + string + suffix
