extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().paused = false
		else:
			get_tree().paused = true
