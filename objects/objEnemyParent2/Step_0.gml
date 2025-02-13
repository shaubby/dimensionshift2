if(active){
	if !aggro {
		if(!collision_line(x,y,objPlayerHitbox.x,objPlayerHitbox.y,objBulletProof2,false,true) and point_direction(x,y,objPlayerHitbox.x,objPlayerHitbox.y)<aggrodistance){
			aggro=true
			sprite_index=aggroSprite;
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
		if(death) image_alpha-=1*dt;
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
}