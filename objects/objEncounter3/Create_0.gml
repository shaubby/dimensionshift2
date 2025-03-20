image_index = 1;
image_speed = 0;
colors = [0x5459ca, 0x9F695C, 0x557d55, 0x51B5EE, 0xa69f76, 0x9D7A94, 0x6a6ad9, 0x6b8dfa]
encounter = false;
colorlist=ds_list_create();
buttons = [objButton1, objButton2, objButton3, objButton4, objButton5, objButton6, objButton7, objButton8];
ds_list_add(colorlist, 0);
ds_list_add(colorlist, 5);
ds_list_add(colorlist, 3);
ds_list_add(colorlist, 2);
ds_list_add(colorlist, 1);
ds_list_add(colorlist, 4);
ds_list_add(colorlist, 1);
ds_list_add(colorlist, 6);
ds_list_add(colorlist, 7);

enemies1=ds_list_create();
enemies2=ds_list_create(); 
dimensionswitch=false;
tocreate1 = ds_list_create();
tocreate2 = ds_list_create();




progress=150;
maxprogress=150