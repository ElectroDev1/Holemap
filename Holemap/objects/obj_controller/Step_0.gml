global.BX = layer_get_x(layer_get_id("Background"));
global.BY = layer_get_y(layer_get_id("Background"));

if(keyboard_check_pressed(vk_left)){
   if(room_previous(room)!=-1){pos--;room_goto_previous();}else{pos=5;room_goto(rm_test_6);}
}

if(keyboard_check_pressed(vk_right)){
   if(room_next(room)!=-1){pos++;room_goto_next();}else{pos=0;room_goto(rm_test_1);}
}