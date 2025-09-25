extends CharacterBody2D
class_name player

@onready var sprite = get_node("AnimatedSprite2D")
var bottom

func _ready() -> void:
	bottom = get_viewport_rect().size.y/2

func _physics_process(_delta: float) -> void:
	sprite.play("default")
	if position.y < bottom - 70:
		velocity.y +=30
	else:
		velocity.y = 0
		
	if position.y < -bottom + 70:
		position.y = -bottom + 70
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y -= 500
		
	move_and_slide()
		
