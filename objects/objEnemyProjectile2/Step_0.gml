if(objDimensions.currentdimension==2) {
	var dt = delta_time/100000;
	var stepspd = spd*dt;

	vx = lengthdir_x(stepspd, dir);
	vy = lengthdir_y(stepspd, dir);
	x+=vx
	y+=vy
	time -=dt;

	if(time <=0 or place_meeting(x, y ,objBulletProof2)) instance_destroy(self)
	var enemy = instance_place(x, y, objPlayerHitbox);
	if(enemy){
		if(!objPlayer.hit) {
			objPlayer.hp-=dmg;
			objPlayer.takeHit();
		}
		instance_destroy(self)
	}
}