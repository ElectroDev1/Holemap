varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform vec2 Texel;

//Modify the following three consts to change the wave effect to your liking
const float xSpeed = 0.01;
const float xFreq = 40.0;
const float xSize = 12.0;

void main()
{
    float xWave = sin(Time*xSpeed + v_vTexcoord.y*xFreq) * (xSize*Texel.x);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + vec2(xWave, xWave));
}