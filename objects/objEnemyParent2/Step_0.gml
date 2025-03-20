if(active){
	if !aggro and timercd<0 {
		if(!collision_line(x,y,objPlayerHitbox.x,objPlayerHitbox.y,objBulletProof2,false,true) and point_distance(x,y,objPlayerHitbox.x,objPlayerHitbox.y)<aggrodistance){
			aggro=true
			sprite_index=aggroSprite;
		}
	}
	var dt = delta_time/100000;
	
	if(timercd>=0){
		timercd-=dt/5;
		if(timed){
			image_alpha+=dt/5;
			if(timercd<=0) aggro=true;
		}
	} 

	var dt = delta_time/100000;

	if(kbcd>0){
		var knockbackvy=lengthdir_y(kbcurrentspd,kbdir);
		var knockbackvx=lengthdir_x(kbcurrentspd,kbdir);
		if(place_meeting(x+knockbackvx*dt, y,  objEnemyAvoidance2)){
			knockbackvx = 0;
		}

		if(place_meeting(x, y+knockbackvy*dt, objEnemyAvoidance2)) {
			knockbackvy= 0;
		}

		if(place_meeting(x+knockbackvx*dt, y+knockbackvy*dt, objEnemyAvoidance2)){
			knockbackvx = 0;
			knockbackvy = 0;
		}
		x+=knockbackvx*dt;
		y+=knockbackvy*dt;
		kbcd-=dt;
		kbcurrentspd-=dt*kbchange
		if(death){ image_xscale-=.05*dt; image_yscale-=.05*dt}
		if(kbcd<0)kbcd=0;
	} else if(kbcd==0){
		image_speed=defaultimagespeed;
		image_blend = c_white;
		kbcd--;
		if(death){
			if(variable_instance_exists(self, "gun")) instance_destroy(gun);
			instance_destroy(self);
			
		}
		kb=false
	}
	depth=9300-y
} else {
	speed=0;
}