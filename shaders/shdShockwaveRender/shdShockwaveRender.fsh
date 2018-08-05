varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fStrength;
uniform sampler2D u_sShockwave;
uniform vec2 u_fTexelSize;

void main()
{
    vec3 shockwaveSample = texture2D( u_sShockwave, v_vTexcoord ).rgb;
    vec2 coord = v_vTexcoord + step( 1./255., shockwaveSample.b )*( 2.*shockwaveSample.rg - 1. )*u_fTexelSize*u_fStrength;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, coord );
}
