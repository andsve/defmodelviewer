varying mediump vec4 var_position;
varying mediump vec3 var_normal;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D tex0;
uniform lowp vec4 tint;
uniform lowp vec4 light;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    vec4 color = texture2D(tex0, var_texcoord0.xy) * tint_pm;
    if (color.a < 0.1) {
        discard;
    }
    gl_FragColor = vec4(color.rgba);
}
