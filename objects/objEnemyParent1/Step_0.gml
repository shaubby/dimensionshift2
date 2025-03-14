if(active){
	var dt = delta_time/100000;
	
	if(timercd>=0){
		timercd-=dt/5;
		image_alpha+=dt/5;
		if(timercd<=0) aggro=true;
	} 

	if !aggro and timercd<0 {
		if(!collision_line(x,y,objPlayerHitbox.x,objPlayerHitbox.y,objBulletProof1,false,true) and point_distance(x,y,objPlayerHitbox.x,objPlayerHitbox.y)<aggrodistance){
			aggro=true
		}
	}

	

	if(kbcd>0){
		var knockbackvy=lengthdir_y(kbcurrentspd,kbdir);
		var knockbackvx=lengthdir_x(kbcurrentspd,kbdir);
		if(place_meeting(x+knockbackvx*dt, y,  objEnemyAvoidance1)){
			knockbackvx = 0;
		}

		if(place_meeting(x, y+knockbackvy*dt, objEnemyAvoidance1)) {
			knockbackvy= 0;
		}

		if(place_meeting(x+knockbackvx*dt, y+knockbackvy*dt, objEnemyAvoidance1)){
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
		if(death){
			if(variable_instance_exists(self, "gun")) instance_destroy(gun);
			instance_destroy(self);
		}
		kbcd--;
		kb=false
	}
	depth=9300-y
} else {
	speed=0;
}