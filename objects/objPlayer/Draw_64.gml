var dt = delta_time/100000;

draw_set_color(#f25a52);
//draw_rectangle(242, 1412, 250 + (hp/maxhp) * 675, 1480, false);
//draw_sprite_ext( sprHealthBar, 0, 200, 1400, 6, 6, 0, c_white, 255);
var i = 0;
while (i < maxhitpoints) {
	if(hitpoints >= i+4){
		draw_sprite_ext( sprHitpoint, 4, 300+35*i, 1300, 5, 5, 0, c_white, 255);
		i+=4;
	} else if (hitpoints >= i+3){
		draw_sprite_ext( sprHitpoint, 3, 300+35*i, 1300, 5, 5, 0, c_white, 255);
		i+=4;
	} else if (hitpoints >= i+2){
		draw_sprite_ext( sprHitpoint, 2, 300+35*i, 1300, 5, 5, 0, c_white, 255);
		i+=4;
	} else if (hitpoints >= i+1){
		draw_sprite_ext( sprHitpoint, 1, 300+35*i, 1300, 5, 5, 0, c_white, 255);
		i+=4;
	} else {
		draw_sprite_ext( sprHitpoint, 0, 300+35*i, 1300, 5, 5, 0, c_white, 255);
		i+=4;
	}
	
}

draw_sprite_ext(sprHealthMeter, 0, 240, 1200, 10, 10, 0, c_white, 255);
draw_sprite_part_ext( sprHealthInterior1, 0, 0, 0, 29*healthmeter1/100, 6, 250, 1200, 10,10, c_white, 255);
draw_sprite_part_ext( sprHealthInterior2, 0, 29-29*healthmeter2/100, 0, 29*healthmeter2/100, 6, 850-290*healthmeter2/100, 1200, 10,10, c_white, 255);

if(healthmeter2 >=100) {
	
	draw_sprite_ext(sprGradient2, 0, 0, 0, 6, 6, 0, c_white, .75);
}

if(healthmeter1 >=100) {
	draw_sprite_ext(sprGradient1, 0, 0, 0, 6, 6, 0, c_white, .4);
} 

if (redFlashAlpha>0){
	draw_sprite_stretched_ext(sprRed,0,0,0,display_get_gui_width(),display_get_gui_height(),c_white,redFlashAlpha);
}  
if (greenFlashAlpha>0){
	draw_sprite_stretched_ext(sprGreen,0,0,0,display_get_gui_width(),display_get_gui_height(),c_white,greenFlashAlpha);
}
if(redFlashAlpha>=0){redFlashAlpha-=.05*dt;}
if(greenFlashAlpha>0) greenFlashAlpha-=.02*dt;


if(hit and redFlashAlpha<=0){
	//draw_sprite_stretched_ext(sprShielded,0,0,0,display_get_gui_width(),display_get_gui_height()/6,c_white,.5);
	//draw_sprite_stretched_ext(sprShielded2,0,0,display_get_gui_height()*3/4,display_get_gui_width(),display_get_gui_height(),c_white,.8);
}
	