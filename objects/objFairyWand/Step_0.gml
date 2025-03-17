var dt=delta_time/100000;
if(owner.active and owner.aggro) {
	x=owner.x
	y=owner.y-1
	
	var idealdir=point_direction(x, y, objPlayerHitbox.x+objPlayer.vx*predictive, objPlayerHitbox.y+objPlayer.vy*predictive);
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
	//image_angle = point_direction(x, y, objPlayerHitbox.x, objPlayerHitbox.y);
	if(objPlayerHitbox.x>x) image_yscale=1;
	else image_yscale=-1;
	if(cd<=0) {
		var projectile = instance_create_layer(x +lengthdir_x(4, image_angle),y+lengthdir_y(4,image_angle), "Instances1", objEnemyProjectileFlying1);
		projectile.dir=self.image_angle
		projectile.spd=22
		projectile.time=100
		projectile.dmg=10
		projectile.image_angle=projectile.dir
		projectile.depth=depth-1;
		
		cd=maxcd;
	}
	
}
depth=owner.depth-2;
if(cd>0)cd-=dt;