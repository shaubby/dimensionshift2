image_index = 1;
image_speed = 0;
colors = [0x5459ca, 0x9F695C, 0x557d55, 0x51B5EE, 0xa69f76, 0x9D7A94, 0x6a6ad9, 0x6b8dfa]
encounter = false;
buttons = [objButton14, objButton24, objButton34, objButton44, objButton54, objButton64];

stage =0;

enemies1=ds_list_create();
enemies2=ds_list_create(); 
dimensionswitch=false;
tocreate1 = ds_list_create();
tocreate2 = ds_list_create();
tocreate1notaggro = ds_list_create();
tocreate2notaggro = ds_list_create();

colorlist=ds_list_create();
ds_list_add(colorlist, 0)
ds_list_add(colorlist, 1)
ds_list_add(colorlist, 2)
ds_list_add(colorlist, 3)
ds_list_add(colorlist, 4)
ds_list_add(colorlist, 5)

spawnx = [3742, 3950]
spawny = [632, 920]
slimecd=70;
slimecdmax=80;
wizardcd=110;
wizardcdmax=150;

open = false


progress=100;
maxprogress=0;
timer1max = 600;
color = 0;