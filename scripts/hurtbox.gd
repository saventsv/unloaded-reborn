extends Area2D
class_name Hurtbox

@export var damage := 10

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	

func _ready() -> void:
	# TODO figure out why it thinks the tree that it is detecting is somehow the player
	area_entered.connect(
		func(area: Area2D) -> void:
			if area.name == "Hitbox" and area.owner.has_method("take_damage"):
				area.owner.take_damage(damage)
	)
