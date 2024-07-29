extends Node

@export var game_ui:CanvasLayer

func _ready():
	GameManager.game_over.connect(trigger_game_over)

func trigger_game_over():
	var time_text:String = str(game_ui.timer_label.text)
	if game_ui:
		game_ui.queue_free()
		game_ui = null
	
	var game_over_ui = preload("res://Systems/UI/game_over_ui.tscn").instantiate()
	game_over_ui.dead_mobs = GameManager.dead_mobs
	game_over_ui.time_survived = time_text
	add_child(game_over_ui)
	
