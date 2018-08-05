attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vWorldPos;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4( in_Position.xyz, 1. );
    
    v_vWorldPos = in_Position.xy;
    v_vTexcoord = in_TextureCoord;
    v_vColour = in_Colour;
}
