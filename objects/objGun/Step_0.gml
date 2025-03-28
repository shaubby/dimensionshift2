x=objPlayer.x
y=objPlayer.y+2
image_angle = point_direction(x, y, mouse_x, mouse_y);
if(mouse_x>x) image_yscale=1;
else image_yscale=-1;
var dt = delta_time/100000;


if mouse_check_button(mb_left) and cd <=0{
	audio_play_sound(sndPlayerShoot1, 1, false);
	var direct = point_direction(x, y, mouse_x, mouse_y)
	with(instance_create_layer(x+lengthdir_x(6, direct), y+lengthdir_y(6, direct), "Instances", objPlayerProjectile)) {
		dir=direct
		if(objDimensions.difficulty == 1) {
			spd=25
			time=10
			dmg=10
		} else if (objDimensions.difficulty == 2){
			spd=30
			time=10
			dmg=15
		}
		image_angle=dir
	}
	cd=firerate;
}
/*if mouse_check_button(mb_right) and cd <=0{
	var direct = point_direction(x, y, mouse_x, mouse_y)
	with(instance_create_layer(x+lengthdir_x(6, direct), y+lengthdir_y(6, direct), "Instances", objPlayerProjectile)) {
		dir=direct
		spd=25*2
		time=10/2
		dmg=1000
		image_angle=dir
	}
	cd=firerate;
}*/
/*if mouse_check_button(mb_right) and cd <=0{
	var direct = point_direction(x, y, mouse_x, mouse_y)
	with(instance_create_layer(x+lengthdir_x(6, direct), y+lengthdir_y(6, direct), "Instances", objPlayerProjectile)) {
		dir=direct
		spd=20
		time=10
		dmg=100
		image_angle=dir
	}
	cd=firerate/2;
}*/
if cd!=0 cd-=dt;
depth=objPlayer.depth-3