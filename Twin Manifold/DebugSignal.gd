extends Label


export(String) var my_signal


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	GameEvents.connect(my_signal, self, "signal_true")


func signal_true():
	visible = true
