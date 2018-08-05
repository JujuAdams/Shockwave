varying vec2 v_vWorldPos;
varying vec4 v_vColour;

uniform vec2 u_vCentre;
uniform float u_fMaxRadius;
uniform float u_fMinRadius;
uniform float u_fPower;

void main()
{
    vec2 delta = v_vWorldPos - u_vCentre;
    float len = length( delta );
    
    //Figure out if we want to drag this fragment
    if ( ( len < u_fMaxRadius ) && ( len > u_fMinRadius ) )
    {
        
        //Use our delta as a direction indicator in the RG channels (after normalisation)
        delta /= len;
        delta = .5 + .5*delta;
        
        //Use the distance from each edge of the donut to fade out the shockwave effect
        float thickness = u_fMaxRadius - u_fMinRadius;
        float midRadius = .5*( u_fMaxRadius + u_fMinRadius );
        float alpha = 1. - abs( 2.*(midRadius - len) / thickness );
        alpha = pow( alpha, u_fPower );
        
        gl_FragColor = vec4( delta, 1., v_vColour.a*alpha );
    }
    else
    {
        gl_FragColor = vec4( 0. );
    }
}
