varying vec2 v_vWorldPos;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fGlobalMaxRadius;
uniform float u_fGlobalMaxExponent;

void main()
{
    vec2 centre     = v_vTexcoord;
    float maxRadius = v_vColour.r*u_fGlobalMaxRadius;
    float minRadius = v_vColour.g*u_fGlobalMaxRadius;
    float power     = v_vColour.b*u_fGlobalMaxExponent;
    
    
    vec2 delta = v_vWorldPos - centre;
    float len = length( delta );
    
    //Figure out if we want to drag this fragment
    if ( (len < maxRadius) && (len > minRadius) )
    {
        
        //Use our delta as a direction indicator in the RG channels (after normalisation)
        delta /= len;
        delta = .5 + .5*delta;
        
        //Use the distance from each edge of the donut to fade out the shockwave effect
        float thickness = maxRadius - minRadius;
        float midRadius = .5*(maxRadius + minRadius);
        float alpha = 1. - abs( 2.*(midRadius - len) / thickness );
        alpha = pow( alpha, power );
        
        gl_FragColor = vec4( delta, 1., v_vColour.a*alpha );
    }
    else
    {
        gl_FragColor = vec4( 0. );
    }
}
