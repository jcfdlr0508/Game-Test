extends Area2D

@onready var game_manager = %"Game Manager"


func _on_body_entered(body):
	queue_free()
	game_manager.add_point()
