extends StateMachine


export(NodePath) onready var agent_path
onready var agent = get_node(agent_path) as Scientist


# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine_ready()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
