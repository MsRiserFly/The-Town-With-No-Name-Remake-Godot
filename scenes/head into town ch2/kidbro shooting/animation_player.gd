extends AnimationPlayer
#Experimental_Animationplayer_animatedcutscene_syncer
@onready var kidbro_shooting = $'..'

func _ready() -> void:
	if "sprite_frames" in kidbro_shooting:
		print("test")
	#if kidbro_shooting.sprite_array:
		#if kidbro_shooting.sprite_array.size() > 0:
			#sync_animation_sprite_array(kidbro_shooting.sprite_array)
	if kidbro_shooting.sprite_frames:
		if kidbro_shooting.sprite_frames:
			sync_spriteframes_animationplayer(kidbro_shooting.sprite_frames)

func sync_animation_sprite_array(selected_sprite_array:Array[SpriteFrames]):
	if selected_sprite_array:
		if selected_sprite_array.size() > 0:
			print("dwawdawdaw")
			var first_animation_name = selected_sprite_array[0].get_animation_names()[0]
			var kid_frame_count = selected_sprite_array[0].get_frame_count(first_animation_name)
			#for setting end frame of animationplayer
			
			var kid_animation_speed = selected_sprite_array[0].get_animation_speed(first_animation_name)
			#for setting fps of animationplayer

			get_animation('kid_bro moving').step = 1.0 / kid_animation_speed
			get_animation('kid_bro moving').length = (1.0 / kid_animation_speed) * kid_frame_count
			#confusing calculation i don't even know
			

func sync_spriteframes_animationplayer(selected_spriteframe:SpriteFrames=null):
	if selected_spriteframe:
		if selected_spriteframe.get_frame_count(selected_spriteframe.get_animation_names()[0]) > 0:
			var first_animation_name = selected_spriteframe.get_animation_names()[0]
			var kid_frame_count = selected_spriteframe.get_frame_count(first_animation_name)
			#for setting end frame of animationplayer
			
			var kid_animation_speed = selected_spriteframe.get_animation_speed(first_animation_name)
			#for setting fps of animationplayer

			get_animation('kid_bro moving').step = 1.0 / kid_animation_speed
			get_animation('kid_bro moving').length = (1.0 / kid_animation_speed) * kid_frame_count
			#confusing calculation i don't even know
			
