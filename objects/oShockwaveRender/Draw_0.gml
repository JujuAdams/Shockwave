//Reconstruct our shockwave surface if it doesn't exist
if ( !surface_exists( shockwave_surface ) ) shockwave_surface = surface_create( surface_get_width( application_surface ), surface_get_height( application_surface ) );

//Build our shockwave surface
surface_set_target( shockwave_surface );

//Clear the entire surface
draw_clear( make_colour_rgb( 127, 127, 0 ) );

if ( instance_number( oShockwave ) > 0 )
{
    if ( global.shockwave_batch )
    {
        if ( vbf_shockwave != noone )
        {
            //Submit the shockwave vertex buffer as a single batch
            shader_set( shdShockwaveBatch );
            shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fGlobalMaxRadius"   ), SHOCKWAVE_BATCH_GLOBAL_MAX_RADIUS );
            shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fGlobalMaxExponent" ), SHOCKWAVE_BATCH_GLOBAL_MAX_EXPONENT );
            vertex_submit( vbf_shockwave, pr_trianglelist, -1 );
            shader_reset();
        }
    }
    else
    {
        //Iterate over every shockwave and draw them
        shader_set( shdShockwave );
        with( oShockwave )
        {
            draw_set_alpha( alpha );
            shader_set_uniform_f( shader_get_uniform( shader_current(), "u_vCentre"    ), x, y );
            shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fMaxRadius" ), max_radius );
            shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fMinRadius" ), min_radius );
            shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fExponent"  ), exponent );
            draw_rectangle( x - max_radius, y - max_radius, x + max_radius, y + max_radius, false );
        }
        draw_set_alpha( 1 );
        shader_reset();
    }
}

surface_reset_target();