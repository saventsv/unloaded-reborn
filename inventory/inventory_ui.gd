extends Control

var is_open := false

func _ready() -> void:
	close()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("open_inventory"):
		if is_open:
			close()
		else:
			open()


func open() -> void:
	visible = true
	is_open = true

func close() -> void:
	visible = false
	is_open = false
