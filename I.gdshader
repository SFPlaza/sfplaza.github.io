shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D gateTexture;
uniform float inactive;

void vertex() {
	//Nothing...
}

void fragment() {
	vec3 COLORi = COLOR.rgb;
	COLOR.rgb = vec3(0.0, 0.0, 0.0);
	float real = 0.0;
	float imag = 0.0;

	for (float c = TEXTURE_PIXEL_SIZE.y/2.0; c <= 1.0; c += TEXTURE_PIXEL_SIZE.y){
		vec4 state;
	// StateVector
		state = texture(TEXTURE, vec2(UV.x+TEXTURE_PIXEL_SIZE.y,c));
		if (state.b > 0.625) {
			state.r *= -1.0;
			state.g *= -1.0;
		}
		else if (state.b > 0.375) {
			state.g *= -1.0;
		}
		else if (state.b > 0.125) {
			state.r *= -1.0;
		}


		vec4 gateIndex;
	// GateMatrix
		gateIndex = texture(gateTexture, vec2(c,UV.y));
		if (gateIndex.b > 0.625) {
			gateIndex.r *= -1.0;
			gateIndex.g *= -1.0;
		}
		else if (gateIndex.b > 0.375) {
			gateIndex.g *= -1.0;
		}
		else if (gateIndex.b > 0.125) {
			gateIndex.r *= -1.0;
		}

	// FOIL the 2 Complex Numbers...
		real += (state.r * gateIndex.r) - (state.g * gateIndex.g);
		imag += (state.r * gateIndex.g) + (state.g * gateIndex.r);

	}

	float negative = 0.0;

	if (real < 0.0){
		negative += 0.25;
		real *= -1.0;
	}
	if (imag < 0.0){
		negative += 0.5;
		imag *= -1.0;
	}
	COLOR.rgb = mix(vec3(real, imag, negative),COLORi.rgb,inactive);

}
