function Holemap_get_map() {
    return global.HolemapMap;
}

function Holemap_map_exists(){
	return ds_exists(Holemap_get_map(),ds_type_map);	
}

function Holemap_check(){
	if(!Holemap_map_exists()){ show_error("Holemap Map doesn't exist.",true); }
}

function Holemap_get_size(){
    Holemap_check();
	return ds_map_size(Holemap_get_map());
}

function Holemap_map_add(name) {
	Holemap_check();
	if(!is_string(name)){name=string(name);}
	
	if(ds_map_exists(Holemap_get_map(),name)){
	   Holemap_free(name);	
	}
	
	var obj = new Holemap_create();
	
    ds_map_add(Holemap_get_map(),name,obj);
	
	return obj;
	
}

function Holemap_create() constructor {
	buffer = -4;
	tempsurf = -4;
	init = 1;
}

function Holemap_get_struct(name) {
	Holemap_check();
	
    return Holemap_get_map()[? name];
	
}

function Holemap_layerInit(name){

        var object = Holemap_get_struct(name);

		if(!surface_exists(object.tempsurf)){
			object.tempsurf = surface_create(room_width,room_height); 	 
		}	
 
        return object;
 
}

function Holemap_layerEnd(lay,name){
	
	var object = Holemap_get_struct(name);

	surface_set_target(object.tempsurf);
  
		if(!is_string(lay)){show_error("layer entry must be a string",true);}
		var _tilemap = layer_tilemap_get_id(layer_get_id(lay));
		draw_tilemap(_tilemap,0,0);
				
	surface_reset_target();                
				
	if(!is_string(lay)){show_error("layer entry must be a string",true);}
				
	layer_set_visible(layer_get_id(lay),0);

	object.buffer = buffer_create((room_width*room_height)*4,buffer_grow,1);
	buffer_get_surface(object.buffer,object.tempsurf,0);
	object.init=0;
			    
	surface_free(object.tempsurf);
	   				 
}

function Holemap_layerEndMulti(layers,name){
	
	var object = Holemap_get_struct(name);

	surface_set_target(object.tempsurf);
  
		for(var a=0; a<array_length(layers); a++){
			var lay = layers[a];
			if(!is_string(lay)){show_error("layer entry must be a string",true);}
			var _tilemap = layer_tilemap_get_id(layer_get_id(lay));
			draw_tilemap(_tilemap,0,0);
			layer_set_visible(layer_get_id(lay),0);;
		}
				
	surface_reset_target();                

	object.buffer = buffer_create((room_width*room_height)*4,buffer_grow,1);
	buffer_get_surface(object.buffer,object.tempsurf,0);
	object.init=0;
			    
	surface_free(object.tempsurf);
							 
}

function Holemap(lay,name) {
	
	global.checkName = name;	  
	
	Holemap_map_add(name);   
	ds_list_add(global.HolemapNames,[name,lay]);
	  
	var object = Holemap_layerInit(name);  
	
	if(!is_array(lay)){
		   		
		if(!is_string(lay)){lay=string(lay);}
		  
			if(!surface_exists(object.tempsurf)){
				object.tempsurf = surface_create(room_width,room_height); 	 
			}	
		 
			Holemap_layerEnd(lay,name);
		   
	}else{

		object.tempsurf = surface_create(room_width,room_height);
		Holemap_layerEndMulti(lay,name);
		
	}
	   
	return object;
	   
}

function Holemap_surface(id) {
		Holemap_check();
		
		var _buf = id.buffer;
		var _surf = surface_create(room_width,room_height);
		buffer_set_surface(_buf,_surf,0);
		return _surf;
}

function Holemap_save(id,fname) {
         Holemap_check();
		 surface_save(id,fname);
}

function Holemap_texture(id) {
         Holemap_check();
		 return surface_get_texture(id);
}

function Holemap_width(id) {
        Holemap_check();
		return surface_get_width(id);
}

function Holemap_height(id) {
        Holemap_check();
		return surface_get_height(id);
}

function Holemap_free(name) {
    	Holemap_check();
		var object = Holemap_get_struct(name);
		var _buff = object.buffer;
		
		buffer_delete(_buff);
		delete object;
		ds_map_delete(Holemap_get_map(),name);
		
}

function Holemap_destroy(){
        Holemap_check();

		for(var a=Holemap_get_size()-1; a>=0; a--){
		    var _name = global.HolemapNames[| a][0];
			Holemap_free(_name);
		}
}

function Holemap_surface_free(id) { 
	surface_free(id); 
}

function Holemap_debug(){
	
	show_debug_overlay(true)

	var _size = Holemap_get_size();
	draw_set_font(fnt_game);

	draw_set_halign(fa_left);
	draw_text(10,45,"HOLEMAP v1.1 by Electro\n"+"FPS: "+string(fps)+"\nHolemaps created: "+string(_size));
		 
	draw_set_halign(fa_right);
		
		 
	for(var a=0; a<_size; a++){

		draw_text(window_get_width()-10,45+16*a,string(global.HolemapNames[| a][1])+
			" : Holemap "+string(a+1)+" '"+string(global.HolemapNames[| a][0])+"'"
		);
			
	}
		 
	draw_set_halign(fa_left);	
}