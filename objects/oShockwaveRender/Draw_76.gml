if ( !surface_exists( surface ) )
{
    surface = surface_create( surface_get_width( application_surface ), surface_get_height( application_surface ) );
}

surface_set_target( surface );
draw_clear( make_colour_rgb( 127, 127, 0 ) );

shader_set( shdShockwave );
with( oShockwave )
{
    draw_set_alpha( alpha );
    shader_set_uniform_f( shader_get_uniform( shader_current(), "u_vCentre"    ), x, y );
    shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fMaxRadius" ), max_radius );
    shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fMinRadius" ), min_radius );
    shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fPower"     ), power_radius );
    draw_rectangle( x - max_radius, y - max_radius, x + max_radius, y + max_radius, false );
}
draw_set_alpha( 1 );
shader_reset();

surface_reset_target();