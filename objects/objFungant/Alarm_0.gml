sprite_index=sprFungusIdle;
if(active){
	direct=point_direction(x,y,objPlayerHitbox.x,objPlayerHitbox.y);
	var projectile = instance_create_layer(x +lengthdir_x(4, direct),y+lengthdir_y(4,direct), "Instances2", objEnemyProjectile1);
	projectile.dir=self.direct
	projectile.spd=6
	projectile.time=100
	projectile.dmg=10
	projectile.image_angle=projectile.dir
	projectile.depth=depth-1;

	projectile = instance_create_layer(x +lengthdir_x(4, direct+20),y+lengthdir_y(4,direct+20), "Instances2", objEnemyProjectile1);
	projectile.dir=self.direct+20
	projectile.spd=6
	projectile.time=100
	projectile.dmg=10
	projectile.image_angle=projectile.dir
	projectile.depth=depth-1;

	projectile = instance_create_layer(x +lengthdir_x(4, direct-20),y+lengthdir_y(4,direct-20), "Instances2", objEnemyProjectile1);
	projectile.dir=self.direct-20
	projectile.spd=6
	projectile.time=100
	projectile.dmg=10
	projectile.image_angle=projectile.dir
	projectile.depth=depth-1;
}