if(objDimensions.currentdimension==1 and objDimensions.projectilesactive1) {
	var dt = delta_time/100000;
	var stepspd = spd*dt;

	vx = lengthdir_x(stepspd, dir);
	vy = lengthdir_y(stepspd, dir);
	x+=vx
	y+=vy
	time -=dt;

	if(time <=0) instance_destroy(self)
	var enemy = instance_place(x, y, objPlayerHitbox);
	if(enemy){
		if(!objPlayer.hit) {
			objPlayer.hp-=dmg;
			objPlayer.takeHit();
		}
		instance_destroy(self)
	}
}
depth=300