shader_type canvas_item;

uniform float density : hint_range(0.0, 1.0) = 0.5;
uniform vec2 fog_offset;
uniform float speed = 0.5;
uniform sampler2D noise_texture;

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 uv_noise = mod(UV + fog_offset,1.0);
	float noise = texture(noise_texture, uv_noise).r;
	float alpha = smoothstep(0.1, 0.9, noise*density);
	COLOR = vec4(0.5, 0.5, 0.5, alpha);
}
