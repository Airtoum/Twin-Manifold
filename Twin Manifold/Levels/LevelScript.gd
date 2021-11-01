extends Node


export(PackedScene) var next_level


# Called when the node enters the scene tree for the first time.
func _ready():
	GameEvents.connect("level_end", self, "next_level")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()


func next_level():
	print("Next Level")
	if next_level:
		get_tree().change_scene_to(next_level)
