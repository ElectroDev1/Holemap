/*
Functions that can be executed to use Holemap

If you see an 'X' in the comment describing the function, 
that means it's suggested to not use it

If you see an '!' in the comment describing the function,
that means it's a function necessary to use Holemap
*/

function Holemap_get_map() {//Return the Holemap ds map id
    return global.HolemapMap;
}

function Holemap_map_exists(){//Return if the Holemap ds map exists 
	return ds_exists(Holemap_get_map(),ds_type_map);	
}

function Holemap_check(){//Throw an error if the Holemap ds map doesn't exist
	if(!Holemap_map_exists()){ show_error("Holemap Map doesn't exist.",true); }
}

function Holemap_get_size(){//Return the size of the Holemap ds map
    Holemap_check();
	return ds_map_size(Holemap_get_map());
}

function Holemap_map_add(lay,name) {//Add an entry to the Holemap ds map - X
	
	Holemap_check();
	if(!is_string(name)){name=string(name);}
	
	if(ds_map_exists(Holemap_get_map(),name)){
	   Holemap_free(name);	
	}
	
	var obj = new Holemap_create();
	
    ds_map_add(Holemap_get_map(),name,obj);
	ds_list_add(global.HolemapNames,[name,lay]);
	
	return obj;
	
}

function Holemap_create() constructor {//Create an Holemap struct - X
	buffer = -4;
	tempsurf = -4;
	init = 1;
}

function Holemap_get_struct(name) {//Return the struct id of an Holemap
	Holemap_check();
	
    return Holemap_get_map()[? name];
	
}

function Holemap_layerInit(name){//Set up a temp surface to create an Holemap - X

        var object = Holemap_get_struct(name);

		if(!surface_exists(object.tempsurf)){
			object.tempsurf = surface_create(room_width,room_height); 	 
		}	
 
        return object;
 
}

function Holemap_layerEnd(lay,name){//Operate on the layer to finalize the Holemap - X
	
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

function Holemap_layerEndMulti(layers,name){//Operate on multiple layers to finalize the Holemap - X
	
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

function Holemap(lay,name) {//Create a new Holemap - !
	  	
	Holemap_map_add(lay,name);   
	
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

function Holemap_surface(id) {//Create a surface from an Holemap id - !
		Holemap_check();
		
		var _buf = id.buffer;
		var _surf = surface_create(room_width,room_height);
		buffer_set_surface(_buf,_surf,0);
		return _surf;
}

function Holemap_free(name) {//Free the Holemap from memory - !
    	Holemap_check();
		var object = Holemap_get_struct(name);
		var _buff = object.buffer;
		
		buffer_delete(_buff);
		delete object;
		ds_map_delete(Holemap_get_map(),name);
		
}

function Holemap_destroy(){//Destroy all the existing Holemaps
        Holemap_check();

		for(var a=Holemap_get_size()-1; a>=0; a--){
		    var _name = global.HolemapNames[| a][0];
			Holemap_free(_name);
		}
}

function Holemap_debug(){//Draw debug information for Holemap
	
	var _size = Holemap_get_size();
	draw_set_font(fnt_game);
    draw_set_valign(fa_top);
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