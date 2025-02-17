event_inherited();


if(active and aggro) {
	var collision = ds_list_create();
	var dt = delta_time/100000;
	gun=laser
	if(!kb){
		
		if(image_alpha<1) image_alpha+=0.0125;
		if(cd>0){
			cd -=dt;
			if(cd<=0){
				disappear=40;
			}
		} else {
			if(disappear>0){
				image_xscale=max(0,image_xscale-0.0260)
				disappear--;
				if(disappear<=0) { 
					while(appear<=0){
						
						var tempdir = random_range(0,360);
						var templength= random_range(mindistance, maxdistance);
						image_xscale=1
						if(!place_meeting(objPlayer.x+lengthdir_x(templength,tempdir),objPlayer.y+lengthdir_y(templength,tempdir), objParentSolid2)){
							x=objPlayer.x+lengthdir_x(templength,tempdir);
							y=objPlayer.y+lengthdir_y(templength,tempdir);

							
							
							appear=40
						}
						image_xscale=0
					}
					
				}
			} else {
				image_xscale=min(1, image_xscale+0.0260)
				appear--;
				if(appear<=0) { 
					cd=random_range(mincd,maxcd);
					alarm_set(0, 1);
				}
				
				
			}
		}

		
		if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
			objPlayer.takeHit();
			objPlayer.hp-=20;
			knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
		}
		/*if(direction<90 or direction>270) image_xscale=1;
		else image_xscale=-1*/
		
	}
	if(instance_exists(laser)){
		if(lasercd<=0){
			if(laser.image_index!=7){
				laser.image_index+=1;
				if(laser.image_index==7){
					lasercd=1;
				} else{
					lasercd=laserchargecd
				}
			} else {
				instance_destroy(laser);
				laser=-1000
				cd=random_range(0,maxcd);
			}
		} else {

			lasercd-=dt/10;
			laser.image_alpha-=dt/30
		}
	}
}

