extends CharacterBody2D

@export var speed = 50; 
@export var current_velocity = Vector2();

enum {STATE_IDLE, STATE_RUN}

var state = STATE_IDLE

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

var current_animation = "idle"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play(current_animation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	match state:
		STATE_IDLE:
			current_animation = "idle"
			current_velocity = Vector2()
			if (Input.is_action_just_pressed("ui_left") or
			Input.is_action_just_pressed("ui_right") or
			Input.is_action_just_pressed("ui_down") or 
			Input.is_action_just_pressed("ui_up")):
				state = STATE_RUN
			animation.flip_h = false
			pass
		STATE_RUN:
			var direction = Vector2();
			if (Input.is_action_pressed("ui_left")):
				direction += Vector2.LEFT
				current_animation = "run_side"
				animation.flip_h = true
			if (Input.is_action_pressed("ui_right")):
				direction += Vector2.RIGHT
				current_animation = "run_side"
				animation.flip_h = false
			if (Input.is_action_pressed("ui_up")):
				direction += Vector2.UP
				current_animation = "run_back"
			if (Input.is_action_pressed("ui_down")):
				direction += Vector2.DOWN
				current_animation = "run_front"
			
			current_velocity = direction * speed; 
			if (not current_velocity):
				state = STATE_IDLE
			pass
	pass
	
	animation.play(current_animation)
	set_velocity(current_velocity)
	move_and_slide()
	pass


func _on_interactbox_body_entered(body: Node2D) -> void:
	if (body.name == "sign"):
		print("sign nearby")
	pass # Replace with function body.


func _on_interactbox_body_exited(body: Node2D) -> void:
	if (body.name == "sign"):
		print("sign no longer nearby")
	pass # Replace with function body.


func _on_interactbox_area_entered(area: Area2D) -> void:
	print("entered")
	pass # Replace with function body.


func _on_interactbox_area_exited(area: Area2D) -> void:
	print("exited")
	pass # Replace with function body.
