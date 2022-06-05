draw_surface_ext(mySurf,0,0,1,1,0,c_white,0.4);

var _sin = sin(current_time*0.005);
var _cos = cos(current_time*0.005);

draw_surface_ext(mySurf,100,80,1+0.1*_sin,1+0.1*_cos,0,c_white,1);
draw_surface_ext(mySurf,room_width-144-100,80,1,1,10*_sin,c_white,1);
draw_surface_ext(mySurf,100,room_height-144-80,1,1,0,
merge_color(c_white,c_red,abs(_sin)),1
);
draw_surface_ext(mySurf,room_width-144-100,room_height-144-80,1,1,0,c_white,abs(_cos));