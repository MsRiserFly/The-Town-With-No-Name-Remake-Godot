extends AnimatedCutsceneSprite2D_sprite_array


func _on_sprite_array_finished():
	print("Sprite array finished")
	get_tree().change_scene_to_file(next_scene_path)
