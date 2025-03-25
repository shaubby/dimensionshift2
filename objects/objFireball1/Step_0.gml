if(objDimensions.currentdimension==1 and objDimensions.projectilesactive1) {
	if(image_speed==0){
		var dt = delta_time/100000;
		var stepspd = spd*dt;
		var idealdir=point_direction(x, y, objPlayerHitbox.x, objPlayerHitbox.y);
		if(idealdir>image_angle){
			if(idealdir-image_angle<180){
				image_angle+=min(idealdir-image_angle,dt*maxrotspd);
			}else {
				image_angle-=min(360-idealdir+image_angle,dt*maxrotspd);
			}
		} else if(idealdir<image_angle){
			if(image_angle-idealdir<180){
				image_angle-=min(image_angle-idealdir,dt*maxrotspd);
			}else {
				image_angle+=min(idealdir-(image_angle-360),dt*maxrotspd);
			}
		}
		dir =image_angle

		vx = lengthdir_x(stepspd, dir);
		vy = lengthdir_y(stepspd, dir);
		x+=vx
		y+=vy
		time -=dt;
		if (death==-1000){
			if(time <=0 or place_meeting(x, y ,objBulletProof1)) instance_destroy(self)
			var enemy = instance_place(x, y, objPlayerHitbox);
			if(enemy){
				if(!objPlayer.hit) {
					objPlayer.hp-=dmg;
					objPlayer.takeHit();
					instance_destroy(self)
				} else if (objPlayer.hit) {
					death=deathtime;
					dir-=180;
					maxspd=spd
				}
			
			}
		} else {
			death-=dt;
			image_alpha=death/deathtime;
			spd=maxspd*(death/deathtime)
			image_xscale=death/deathtime
			image_yscale=death/deathtime
			image_blend = c_red;
			if(death<=0){ instance_destroy(self)}
		}
		var proj = instance_place(x, y, objPlayerProjectile);
		if(proj){
			instance_destroy(proj);
			image_index-=1;
			if(image_index<1) instance_destroy(self);
			
			//show_debug_message(image_index);
			image_speed=0
		}
	} else {
		image_speed=1;
	}
		
} else {
	image_speed = 0;
}
if(image_index == 3){
	formed = true;
	image_speed = 0;
}
depth=9300-y-3