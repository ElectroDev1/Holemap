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
		
		gpu_set_blendmode(bm_subtract);
		
			with(obj_erase){

				 draw_circle(mouse_x-other.camera_x+other.extra/2,
				 mouse_y-other.camera_y+other.extra/2,30,0);
				
			}
			
		gpu_set_blendmode(bm_normal);
		
		
		
				
	surface_reset_target();
	  
	draw_surface(FinalSurface,camera_x-extra/2,camera_y-extra/2);
	
}

