
surface_set_target(finalSurf);
    draw_clear_alpha(c_white,0);

	draw_circle(mouse_x,mouse_y,40,0);


	draw_surface(mySurf,0,0);
	
	gpu_set_blendmode(bm_subtract);
	with(obj_erase_mask){
	     draw_self();	
	}
	draw_circle(mouse_x,mouse_y,40,0);

	
	gpu_set_blendmode(bm_max);
	
	   draw_set_alpha(0.4+sin(current_time*0.01)*0.2);
	   draw_circle(128+sin(current_time*0.01)*20,60+cos(current_time*0.01)*20,24,0)
	   
	   draw_circle(83+sin(current_time*0.01)*40,328+cos(current_time*0.01)*20,24,0)
	   draw_set_alpha(1);
	
	gpu_set_blendmode(bm_normal);

surface_reset_target();

draw_surface(finalSurf,0,0);