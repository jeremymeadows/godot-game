extends Control


func _ready() -> void:
	$Resolution/ItemList.select(Global.RESOLUTIONS.find(get_window().size))


func _on_menu_pressed() -> void:
	Global.main_menu()


func _on_item_list_item_selected(index: int) -> void:
	get_window().size = Global.RESOLUTIONS[index]


func _on_item_list_tree_exiting() -> void:
	Global.save_game()


func _on_volume_value_changed(value: float) -> void:
	var music_ndx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(music_ndx, value == -20)
	AudioServer.set_bus_volume_db(music_ndx, value)
