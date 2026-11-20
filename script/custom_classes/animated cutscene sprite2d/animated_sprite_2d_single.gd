extends AnimatedSprite2D
class_name AnimatedCutsceneSprite2D_single

func _ready() -> void:
	fit_to_viewport()
	play()

func fit_to_viewport():
	if sprite_frames:
		if sprite_frames.get_frame_count(sprite_frames.get_animation_names()[0]):
			var texture : Texture2D= sprite_frames.get_frame_texture(
				sprite_frames.get_animation_names()[0],
				0
			)

			var viewport_size: Vector2 = get_viewport_rect().size
			var image_size: Vector2 = texture.get_size()

			var scale_x: float = viewport_size.x / image_size.x
			var scale_y: float = viewport_size.y / image_size.y

			scale = Vector2(scale_x, scale_y)
			position = viewport_size / 2
