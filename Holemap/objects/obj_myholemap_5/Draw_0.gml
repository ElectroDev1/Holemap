surface_set_target(finalSurf);
    draw_clear_alpha(c_white,0);

	draw_surface(mySurf,0,0);
	
	gpu_set_colorwriteenable(1,1,1,0);
	
	draw_circle(mouse_x,mouse_y,40,0);
	
	draw_circle(room_width/2+(room_width/2-100)*sin(current_time*0.002),
	room_height/2+(room_height/2-100)*cos(current_time*0.002),100,0);
	
	gpu_set_colorwriteenable(1,1,1,1);


surface_reset_target();

draw_surface(finalSurf,0,0);