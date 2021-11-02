extends Node


export(NodePath) var wasd
export(NodePath) var arrows

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("wasd"):
		get_node(wasd).visible = true
		get_node(arrows).visible = false
	if Input.is_action_just_pressed("arrows"):
		get_node(wasd).visible = false
		get_node(arrows).visible = true
