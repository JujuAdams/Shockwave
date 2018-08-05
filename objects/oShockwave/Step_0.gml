t = clamp( (current_time - create_time) / lifespan, 0, 1 );
if ( t >= 1 ) instance_destroy();

max_radius = t * 150;
min_radius = t *  20;
exponent = lerp( 3, 0.5, t );
alpha = sqr( 1 - t );