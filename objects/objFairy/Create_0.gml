event_inherited();
path = path_add();
spd=5
walkspd=5;
hp=40
kblength=2;
kbspd=10;
gun=instance_create_layer(x, y, "Instances1", objFairyWand)
gun.owner=self;
gun.x=x
gun.y=y-3
gun.depth=self.depth-1;
alarm_set(0,1);
sprite_index=sprFairy;
aggroSprite=sprFairy;