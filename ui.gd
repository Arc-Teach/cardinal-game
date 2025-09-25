extends Node

@onready var score_display = get_node("Score_Label")
@onready var missed_display = get_node("Missed_Label")
@onready var accuracy_display = get_node("Accuracy_Label")
@onready var directions_display = get_node("Directions_Label")
@onready var score_text = get_node("Score_Label/Score")
@onready var missed_text = get_node("Missed_Label/Missed")
@onready var accuracy_text = get_node("Accuracy_Label/Accuracy")

var score = 0
var misses = 0
var accuracy = 0.0

func _ready() -> void:
	var view_rect = get_viewport().get_visible_rect().size
	score_display.global_position.x = -view_rect.x/2+50
	score_display.global_position.y = -view_rect.y/2+50
	missed_display.global_position.x = view_rect.x/2-50
	missed_display.global_position.y = -view_rect.y/2 +50
	accuracy_display.global_position.y = -view_rect.y/2 + 50
	directions_display.global_position.y = view_rect.y/2 -50
	
func _process(delta: float) -> void:
	score_text.text = "Score: " + str(score)
	missed_text.text = "Missed: " + str(misses)
	if score > 0 or misses > 0:
		accuracy = float(score) / (float(misses)+float(score))
	accuracy_text.text = "Accuracy: " + str(int(accuracy*100)) + "%"
