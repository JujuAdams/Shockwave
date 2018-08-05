//Turn off automatic application surface drawing, and turn on interpolation
application_surface_draw_enable( false );
gpu_set_tex_filter( true );

//Utility variables used
fps_smoothed = 5000;

//The main distortion texture
shockwave_surface = noone;

//Batch specific values
//I've noticed that using batch mode is way faster in YYC, but slightly slower in VM (for Windows)
global.shockwave_batch = true;

#macro SHOCKWAVE_BATCH_GLOBAL_MAX_RADIUS 150
#macro SHOCKWAVE_BATCH_GLOBAL_MAX_EXPONENT 3

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();
vertex_format_add_texcoord();
global.vft_2d = vertex_format_end();

vbf_shockwave = noone;