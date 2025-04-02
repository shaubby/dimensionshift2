event_inherited()
time=0
dir = 0
spd=25
dmg=0;
death=-1000
deathtime=3;
maxspd=spd
shoot=false;
if(objDimensions.difficulty==1) {
predictive=random_range(3,6);
} else  {
	predictive=random_range(1, 2);
}
offset=-1000

