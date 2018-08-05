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
    if ( ( len < u_fMaxRadius ) && ( len > u_fMinRadius ) )
    {
        delta /= len;
        delta = .5 + .5*delta;
        
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
