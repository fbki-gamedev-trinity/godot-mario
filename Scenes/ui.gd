extends CanvasLayer

func _process(_delta: float) -> void:
	$Lives.text = "Lives: " + str(Global.player_lives)
