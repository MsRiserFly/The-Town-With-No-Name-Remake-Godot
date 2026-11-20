extends AnimationPlayer
class_name AnimationPlayerInteractive_base
#Experimental_Animationplayer_animatedcutscene_syncer
@export var targeted_sprite : AnimatedSprite2D

func _ready() -> void:
	if "sprite_frames" in targeted_sprite:
		print("test")
	#if targeted_sprite.sprite_array:
		#if targeted_sprite.sprite_array.size() > 0:
			#sync_animation_sprite_array(targeted_sprite.sprite_array)
	if targeted_sprite:
		if targeted_sprite.sprite_frames:
			if targeted_sprite.sprite_frames:
				sync_spriteframes_animationplayer(targeted_sprite.sprite_frames)

func sync_animation_sprite_array(selected_sprite_array:Array[SpriteFrames]):
	if selected_sprite_array:
		if selected_sprite_array.size() > 0:
			print("dwawdawdaw")
			var first_animation_name = selected_sprite_array[0].get_animation_names()[0]
			var kid_frame_count = selected_sprite_array[0].get_frame_count(first_animation_name)
			#for setting end frame of animationplayer
			
			var kid_animation_speed = selected_sprite_array[0].get_animation_speed(first_animation_name)
			#for setting fps of animationplayer

			get_animation(get_animation_list()[0]).step = 1.0 / kid_animation_speed
			get_animation(get_animation_list()[0]).length = (1.0 / kid_animation_speed) * kid_frame_count
			#confusing calculation i don't even know
			

func sync_spriteframes_animationplayer(selected_spriteframe:SpriteFrames=null):
	if selected_spriteframe:
		if selected_spriteframe.get_frame_count(selected_spriteframe.get_animation_names()[0]) > 0:
			var first_animation_name = selected_spriteframe.get_animation_names()[0]
			var kid_frame_count = selected_spriteframe.get_frame_count(first_animation_name)
			#for setting end frame of animationplayer
			
			var kid_animation_speed = selected_spriteframe.get_animation_speed(first_animation_name)
			#for setting fps of animationplayer

			speed_scale = speed_scale - (1.0 / kid_animation_speed)
			print(speed_scale)
			print((1.0 / kid_animation_speed))
			
			print(speed_scale)
			#speed_scale = 0.9
			
			get_animation(get_animation_list()[0]).length = (1.0 / kid_animation_speed) * kid_frame_count
			#confusing calculation i don't even know
			
