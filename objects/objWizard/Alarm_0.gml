if(active){
	
	var direct=point_direction(x,y,objPlayerHitbox.x,objPlayerHitbox.y);
	laser=instance_create_layer(x+lengthdir_x(10,direct),y+lengthdir_y(10,direct)-9,"Instances2",objLaser);
	laser.image_xscale=50;
	laser.image_speed=0;
	laser.image_angle=direct;
	lasercd=laserchargecd;
	laser.visible=true;
	laser.active=true;
	
}