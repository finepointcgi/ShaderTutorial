shader_type canvas_item;

uniform sampler2D grayscaleImage : filter_nearest;
uniform vec4 lowColor : source_color;
uniform vec4 midColor : source_color;
uniform vec4 highColor : source_color;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 grayscaleTexture = textureLod(grayscaleImage, UV, 0.0);
	float grayscaleValue = grayscaleTexture.r;
	float alphaValue = grayscaleTexture.a;
	
	vec4 color = mix(lowColor, midColor, grayscaleValue);
	color = mix(color, highColor, pow(grayscaleValue, 1.0));
	
	color.a *= alphaValue;
	
	COLOR = color;
	
}

