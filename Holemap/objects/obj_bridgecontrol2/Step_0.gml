

//This is for testing purposes
var _keys = keyboard_check(vk_right)-keyboard_check(vk_left);
vx+=6*_keys;

vx=clamp(vx,0,room_width-WIDTH-extra);

camera_set_view_pos(CAMERA,vx,0);

if(keyboard_check_pressed(vk_enter)){
   window_set_fullscreen(!window_get_fullscreen());	
}

if(keyboard_check_pressed(ord("T"))){
   with(obj_erase){visible=!visible;}	
}

//Get the camera position
camera_x = camera_get_view_x(CAMERA);
camera_y = camera_get_view_y(CAMERA);
