//recieve damage 
if place_meeting (x, y, obj_DamageEnemy)
{
	var _inst = instance_place(x, y, obj_DamageEnemy);
	
	//take damage from specific instance 
	hp -= _inst.damage; 
	
	//tell the damage instance to destroy itself 
	_inst.destroy = true;
}


//death 
if hp <= 0
{
	instance_destroy();
}

//chase the player 
    dir = point_direction(x, y, obj_flence.x, obj_flence.y);

     xspd = lengthdir_x(spd,dir);
	 yspd = lengthdir_y(spd,dir);
	 
	 //collision
	 if place_meeting(x+ xspd, y, oWall) || place_meeting(x + xspd, y, obj_enemiesParent)
	 {xspd = 0}
	
	if place_meeting(x, y + yspd, oWall) || place_meeting(x, y + yspd, obj_enemiesParent)
	 {yspd = 0}
	 
	 //moving
	 x += xspd;
	 y += yspd;