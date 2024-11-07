extends CanvasLayer

@onready var textbox_container: MarginContainer = $textboxContainer
@onready var start: Label = $textboxContainer/MarginContainer/HBoxContainer/start
@onready var label: Label = $textboxContainer/MarginContainer/HBoxContainer/Label
@onready var end: Label = $textboxContainer/MarginContainer/HBoxContainer/end

const CHAR_READ_RATE = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_textbox()
	add_text("This text is going to be added!")
	pass # Replace with function body.

# Hide textbox
func hide_textbox() -> void: 
	textbox_container.hide()
	start.text = "";
	label.text = "";
	end.text = "";
	pass

func show_textbox() -> void:
	textbox_container.show()
	start.text = "*";
	pass

func add_text(next_text: String) -> void: 
	label.text = next_text;
	show_textbox();
	var tween = get_tree().create_tween()
	# tween.tween_property(label, "visible_characters", , len(next_text) * CHAR_READ_RATE).from(0).finished
	tween.connect("finished", on_tween_finished)
	pass
	
func on_tween_finished() -> void: 
	end.text = "v"
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
