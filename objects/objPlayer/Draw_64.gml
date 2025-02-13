var dt = delta_time/100000;

draw_set_color(#f25a52);
draw_rectangle(242, 1412, 250 + (hp/maxhp) * 675, 1480, false);
draw_sprite_ext( sprHealthBar, 0, 200, 1400, 6, 6, 0, c_white, 255);
if (redFlashAlpha>0){
	draw_sprite_stretched_ext(sprRed,0,0,0,display_get_gui_width(),display_get_gui_height(),c_white,redFlashAlpha);
}
if(redFlashAlpha>=0){redFlashAlpha-=.05*dt;}