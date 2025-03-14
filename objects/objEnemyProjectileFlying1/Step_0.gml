if(objDimensions.currentdimension==1 and objDimensions.projectilesactive1) {
	var dt = delta_time/100000;
	var stepspd = spd*dt;

	vx = lengthdir_x(stepspd, dir);
	vy = lengthdir_y(stepspd, dir);
	x+=vx
	y+=vy
	time -=dt;
	if (death==-1000){
		if(time <=0 or place_meeting(x,y,objBulletProof1)) instance_destroy(self)
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
}
depth=300