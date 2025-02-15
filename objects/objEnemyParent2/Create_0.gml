event_inherited();
spd=5
hp=100
kb=false

defaultimagespeed=image_speed;
kblength=5;
kbspd=2;

kbcd=0;
kbcurrentspd=0;
kbdir=0;
kbchange=0;
aggro=false;
aggrodistance=200;
death=false
timer1=false;
timer2=false;
timercd=0;
if(timer1=true) {
	timercd=1;
	image_alpha=0;
	image_blend=c_white;
	aggro=true;
}

function knockback(length, dir, kbspd) {
	kb=true
	kbcurrentspd=kbspd
	kbdir=dir
	kbcd=length;
	kbchange=kbspd/length;
	image_speed=0
	image_blend = c_red;
	if(hp<=0){
		death=true;
		kbdir=kbdir*2
	}
}
function knockbackNoRed(length, dir, kbspd) {
	kb=true
	kbcurrentspd=kbspd
	kbdir=dir
	kbcd=length;
	kbchange=kbspd/length;
	image_speed=0
}