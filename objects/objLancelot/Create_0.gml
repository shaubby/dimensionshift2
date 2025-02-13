event_inherited();
path = path_add();
spd=5
walkspd=2;
hp=100
kblength=2;
kbspd=10;
gun=instance_create_layer(x, y, "Instances2", objLancelotGun)
gun.owner=self;
gun.x=x
gun.y=y+4
gun.depth=self.depth-1;
sprite_index=sprLancelotIdle;
aggroSprite=sprLancelotRun;