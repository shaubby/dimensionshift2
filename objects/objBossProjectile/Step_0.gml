if(objDimensions.currentdimension==2 and objDimensions.projectilesactive2) {
	if(shoot){
		var dt = delta_time/100000;
		var stepspd = spd*dt;

		vx = lengthdir_x(stepspd, dir);
		vy = lengthdir_y(stepspd, dir);
		x+=vx
		y+=vy

		if (death==-1000){
			if(place_meeting(x, y ,objBulletProof2)) instance_destroy(self)
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
	} else {
		x = objBoss.x + lengthdir_x(32, point_direction(objBoss.x, objBoss.y-22, objPlayerHitbox.x, objPlayerHitbox.y)+offset)
		y = objBoss.y-22 + lengthdir_y(32, point_direction(objBoss.x, objBoss.y-22, objPlayerHitbox.x, objPlayerHitbox.y)+offset)
		dir = point_direction(x, y, objPlayerHitbox.x + objPlayer.vx*predictive, objPlayerHitbox.y + objPlayer.vy*predictive);
		image_angle = dir;
	}
		
}
depth=9300-y-3

