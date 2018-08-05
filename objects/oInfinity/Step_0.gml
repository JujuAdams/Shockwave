for( var _i = 0; _i < 1; _i += 1/5 )
{
    instance_create_layer( lerp( xprevious, x, _i ),
                           lerp( yprevious, y, _i ),
                           "Instances", oShockwave );
}