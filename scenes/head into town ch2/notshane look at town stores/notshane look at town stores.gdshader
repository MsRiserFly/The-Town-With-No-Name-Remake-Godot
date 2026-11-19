shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;
// 0.0 = normal screen, 1.0 = completely black
uniform float fade_progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 color = texture(screen_texture, SCREEN_UV);
    
    // Quantize to Amiga's 4-bit per channel (0 to 15 levels)
    vec3 amiga_rgb = floor(color.rgb * 15.0 + 0.5);
    
    // Step down brightness in discrete integer increments (16 steps total)
    float step_amount = floor(fade_progress * 16.0);
    amiga_rgb = max(vec3(0.0), amiga_rgb - vec3(step_amount));
    
    // Convert back to normalized 0.0 - 1.0 range
    COLOR = vec4(amiga_rgb / 15.0, 1.0);
}
