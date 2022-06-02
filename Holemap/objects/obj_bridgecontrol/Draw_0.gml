//Copy the buffer data to the surface
if (!surface_exists(BufferSurface) && buffer_exists(buff)) {
   BufferSurface = surface_create(room_width,room_height);
   buffer_set_surface(buff,BufferSurface,0);
}
   
//Draw the final surface
if(!surface_exists(FinalSurface)){ 
	
	FinalSurface=surface_create(WIDTH,HEIGHT); 
	
}else if(surface_exists(BufferSurface)){
	
	surface_set_target(FinalSurface);
	   
		draw_clear_alpha(c_white,0);
		
		//Draw the tiles
	    draw_surface(BufferSurface,-camera_x+extra/2,-camera_y+extra/2);
		
		//Make "holes" in the tile surface and more!
		//Change this code to draw rectangles inbetween the bridge edges
		//Remember to offset it by the negative of the view's position
		
		gpu_set_colorwriteenable(1,1,1,0);
		gpu_set_blendmode(bm_add);
			
		var _blue = make_color_rgb(0,0,255);

		draw_primitive_begin(pr_trianglestrip);
		
		  draw_vertex_color(0,0,_blue,0);
		  draw_vertex_color(WIDTH+extra/2,0,_blue,0.2);
		  draw_vertex_color(0,HEIGHT+extra/2,_blue,0.2);
		  draw_vertex_color(WIDTH+extra/2,HEIGHT+extra/2,_blue,0.4);
		  
		draw_primitive_end();

		gpu_set_colorwriteenable(1,1,1,1);
		gpu_set_blendmode(bm_subtract);
		
			with(obj_erase){
				
				 draw_sprite_ext(sprite_index,image_index,x-other.camera_x+other.extra/2,
				 y-other.camera_y+other.extra/2,image_xscale,image_yscale,image_angle,c_white,1);

				 draw_circle(mouse_x-other.camera_x+other.extra/2,
				 mouse_y-other.camera_y+other.extra/2,30,0);
				
			}
			
		gpu_set_blendmode(bm_normal);
		
		
		
				
	surface_reset_target();
	  
	draw_surface(FinalSurface,camera_x-extra/2,camera_y-extra/2);
	
}

