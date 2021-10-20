extends Scientist


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# subclass happens first before superclass
func _physics_process(delta):
	self.input_flags = cons.INPUT_NONE
	if Input.is_action_pressed("Left"):
		self.input_flags |= cons.INPUT_LEFT
	if Input.is_action_pressed("Right"):
		self.input_flags |= cons.INPUT_RIGHT
	if Input.is_action_just_pressed("Up"):
		self.input_flags |= cons.INPUT_UP
	if Input.is_action_pressed("Down"):
		self.input_flags |= cons.INPUT_DOWN
	if Input.is_action_just_pressed("Clone"):
		self.input_flags |= cons.INPUT_CLONE
