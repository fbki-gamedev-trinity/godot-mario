extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	Global.player_lives = 3
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_quete_pressed() -> void:
	get_tree().quit()
