extends Node2D

var count: int
var type: String = "Wood"

func _ready() -> void:
	count = randi_range(1, 3)
	
