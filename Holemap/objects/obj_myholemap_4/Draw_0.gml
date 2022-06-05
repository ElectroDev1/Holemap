shader_set(shd_heat);

var uTime = shader_get_uniform(shd_heat, "Time");
var uTexel = shader_get_uniform(shd_heat, "Texel");
var tex = Holemap_texture(mySurf);

shader_set_uniform_f(uTime, current_time/2);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));

draw_surface(mySurf,0,0);
	
shader_reset();
