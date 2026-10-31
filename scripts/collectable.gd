extends Area2D
class_name Collectable

func _init() -> void:
	collision_layer = 0
	collision_mask = 3
	
func _ready() -> void:
	area_entered.connect(
		func(area: Area2D) -> void:
			if area is CollectionArea and area.has_method("collect"):
				area.collect(owner.count, owner.type)
	)
