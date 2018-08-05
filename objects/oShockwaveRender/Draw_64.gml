draw_text( 10, 10, @"Fragment shader-based shockwave
@jujuadams 2018/08/05" );

draw_text( 420, 10, @"Left click: Create shockwave
Right click: Stream shockwaves
Enter: See shockwave surface
Space: Switch batch mode on/off" );

draw_text( 870, 10, (global.shockwave_batch ? "One batch" : "Multiple batches") + @"
FPS: " + string( fps ) + "/" + string( fps_smoothed ) + @"
Instances: " + string( instance_count ) );