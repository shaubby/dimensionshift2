event_inherited();
path = path_add();
spd=2
hp=400
maxhp=400
hp=1600
maxhp=1600

kblength=0;
kbspd=0;
movecd = 20;
minmovecd = 12;
maxmovecd=15;
start=false
boss=true
sprite_index=sprBoss;
aggroSprite=sprBoss;
spikes = ds_list_create();
spikescd=0;
spikesmaxcd=10;
currentmove =-1;
laser = -1000;
lasercd = -1000;
laser2 = -1000;
laser2cd = -1000;
laser3 = -1000;
laser3cd = -1000;
lasercdmax = 5;
laserstimer = -1000;
laserstimermax = 15
if(objDimensions.difficulty==1) {
predictivemin=3;
predictivemax=5;
} else {
	predictivemin=0;
predictivemax=1;
}