function colorOverlayInit(r=255,g=255,b=255,a=255){
		shader_set(shd_color_overlay);
		var _u_fact = shader_get_uniform(shd_color_overlay, "blackFactor");
		var _u_col = shader_get_uniform(shd_color_overlay, "dest_color");
		shader_set_uniform_f(_u_fact, global.factor);
		shader_set_uniform_f_array(_u_col, [r,g,b,a]);
}

function colorOverlayEnd(){shader_reset();}