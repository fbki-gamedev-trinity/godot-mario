extends Node2D


var hits = 0
var max_hits = 2
var tile_ids = [0, 1, 2] 

func hit():
	hits += 1
	if hits <= max_hits:
		$TileMapLayer.set_cellv(position, tile_ids[hits])  # Меняем тайл в зависимости от количества ударов
	if hits == max_hits:
		queue_free()  # Удаляем блок, если он разрушен
