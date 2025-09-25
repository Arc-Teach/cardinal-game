extends Node2D

@onready var score_hoop = get_node("Score Hoop")
@onready var ui = get_node("UI")

func _ready() -> void:
	score_hoop.hoop_event.connect(_on_score)
	
func _on_score(score_flag):
	if score_flag:
		ui.score+=1
	else:
		ui.misses+=1
