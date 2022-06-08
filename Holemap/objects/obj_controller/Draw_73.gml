draw_set_font(fnt_game);
draw_set_halign(fa_center); draw_set_valign(fa_top);

draw_text_transformed(room_width/2,10,ROOMS[pos],2
,2,0);

Holemap_debug();

draw_set_halign(fa_center); draw_set_valign(fa_bottom);

draw_text_transformed(room_width/2,room_height-10,"Use Left and Right arrows to change room",2,2,0);
