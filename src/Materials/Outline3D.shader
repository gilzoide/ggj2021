shader_type spatial;

render_mode unshaded, cull_front;

uniform bool enable = true;
uniform vec4 color : hint_color = vec4(1);
uniform float thickness = 0.02;

void vertex() {
	VERTEX += float(enable) * NORMAL * thickness;
}

void fragment() {
	ALBEDO = color.rgb;
	ALPHA = float(enable) * color.a;
}