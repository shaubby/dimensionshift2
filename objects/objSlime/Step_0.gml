event_inherited();


if(active and aggro) {
	var collision = ds_list_create();
	
	instance_place_list(x,y,objHitbox1, collision, true);
	if(!kb){
		var dt = delta_time/100000;
		mp_potential_settings(30, 10, 50, true)
		mp_potential_step_object(objPlayerHitbox.x, objPlayerHitbox.y, dt*spd, objEnemyAvoidance1)
		if(direction<90 or direction>270) image_xscale=1;
		else image_xscale=-1
		if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
			objPlayer.takeHit();
			objPlayer.hp-=20;
			knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
		}
	}
}

